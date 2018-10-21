package pixi.sound;

import js.Promise;
import pixi.sound.interfaces.IMediaInstance;
import haxe.extern.EitherType;
import pixi.sound.filters.Filter;
import pixi.sound.htmlaudio.HTMLAudioContext;
import pixi.sound.webaudio.WebAudioContext;
import pixi.sound.interfaces.IMediaContext;
import pixi.sound.Sound.Options;

//                             Options|string|ArrayBuffer|HTMLAudioElement
typedef SoundMap = Map<String, Dynamic>;

/**
 * Contains all of the functionality for using the **pixi-sound** library.
 * This is deisnged to play audio with WebAudio and fallback to HTML5.
 * @namespace PIXI.sound
 */

/**
 * @description Manages the playback of sounds.
 * @class SoundLibrary
 * @memberof PIXI.sound
 * @private
 */
@:native("PIXI.sound.SoundLibrary")
extern class SoundLibrary
{
    /**
     * Singleton instance
     */
    static var instance:SoundLibrary;

    /**
     * For legacy approach for Audio. Instead of using WebAudio API
     * for playback of sounds, it will use HTML5 `<audio>` element.
     * @name PIXI.sound#_useLegacy
     * @type {boolean}
     * @default false
     * @private
     */
    private var _useLegacy:Bool;

    /**
     * The global context to use.
     * @name PIXI.sound#_context
     * @type {PIXI.sound.webaudio.WebAudioContext}
     * @private
     */
    private var _context:IMediaContext;

    /**
     * The WebAudio specific context
     * @name PIXI.sound#_webAudioContext
     * @type {PIXI.sound.webaudio.WebAudioContext}
     * @private
     */
    private var _webAudioContext:WebAudioContext;

    /**
     * The HTML Audio (legacy) context.
     * @name PIXI.sound#_htmlAudioContext
     * @type {PIXI.sound.webaudio.WebAudioContext}
     * @private
     */
    private var _htmlAudioContext:HTMLAudioContext;

    /**
     * The map of all sounds by alias.
     * @name PIXI.sound#_sounds
     * @type {Object}
     * @private
     */
    private var _sounds:Map<String, Sound>;

    function new ();

    /**
     * Re-initialize the sound library, this will
     * recreate the AudioContext. If there's a hardware-failure
     * call `close` and then `init`.
     * @method PIXI.sound#init
     * @return {PIXI.sound} Sound instance
     */
    function init():SoundLibrary;

    /**
     * The global context to use.
     * @name PIXI.sound#context
     * @readonly
     * @type {PIXI.sound.IMediaContext}
     */
    var context(default, null):IMediaContext;

    /**
     * Initialize the singleton of the library
     * @method PIXI.sound.SoundLibrary.init
     * @return {PIXI.sound}
     */
    static function init():SoundLibrary;

    /**
     * Apply filters to all sounds. Can be useful
     * for setting global planning or global effects.
     * **Only supported with WebAudio.**
     * @example
     * // Adds a filter to pan all output left
     * PIXI.sound.filtersAll = [
     *     new PIXI.sound.filters.StereoFilter(-1)
     * ];
     * @name PIXI.sound#filtersAll
     * @type {PIXI.sound.filters.Filter[]}
     */
    var filtersAll:Array<Filter>;

    /**
     * `true` if WebAudio is supported on the current browser.
     * @name PIXI.sound#supported
     * @readonly
     * @type {boolean}
     */
    var supported(default, null):Bool;

    /**
     * Register an existing sound with the library cache.
     * @method PIXI.sound#add
     * @param {String} alias The sound alias reference.
     * @param {PIXI.sound.Sound} sound Sound reference to use.
     * @return {PIXI.sound.Sound} Instance of the Sound object.
     */

    /**
     * Adds a new sound by alias.
     * @method PIXI.sound#add
     * @param {String} alias The sound alias reference.
     * @param {ArrayBuffer|String|Object|HTMLAudioElement} options Either the path or url to the source file.
     *        or the object of options to use.
     * @param {String} [options.url] If `options` is an object, the source of file.
     * @param {ArrayBuffer|HTMLAudioElement} [options.source] If sound is already preloaded, available.
     * @param {boolean} [options.autoPlay=false] true to play after loading.
     * @param {boolean} [options.preload=false] true to immediately start preloading.
     * @param {boolean} [options.singleInstance=false] `true` to disallow playing multiple layered instances at once.
     * @param {number} [options.volume=1] The amount of volume 1 = 100%.
     * @param {number} [options.speed=1] The playback rate where 1 is 100% speed.
     * @param {Object} [options.sprites] The map of sprite data. Where a sprite is an object
     *        with a `start` and `end`, which are the times in seconds. Optionally, can include
     *        a `speed` amount where 1 is 100% speed.
     * @param {PIXI.sound.Sound~completeCallback} [options.complete=null] Global complete callback when
     *        play is finished.
     * @param {PIXI.sound.Sound~loadedCallback} [options.loaded=null] Call when finished loading.
     * @return {PIXI.sound.Sound} Instance of the Sound object.
     */
    @:overload(function(alias:String, options:Dynamic):Sound {})

    /**
     * Adds multiple sounds at once.
     * @method PIXI.sound#add
     * @param {Object} map Map of sounds to add, the key is the alias, the value is the
     *        `string`, `ArrayBuffer`, `HTMLAudioElement` or the list of options
     *        (see {@link PIXI.sound.add} for options).
     * @param {Object} globalOptions The default options for all sounds.
     *        if a property is defined, it will use the local property instead.
     * @return {PIXI.sound.Sound} Instance to the Sound object.
     */
    @:overload(function(map:SoundMap, ?globalOptions:Options):Map<String, Sound> {})

    // Actual method
    function add(source:Dynamic, ?sourceOptions:Dynamic):EitherType<Map<String, Sound>, Sound>;

    /**
     * Internal methods for getting the options object
     * @method PIXI.sound#_getOptions
     * @private
     * @param {string|ArrayBuffer|HTMLAudioElement|Object} source The source options
     * @param {Object} [overrides] Override default options
     * @return {Object} The construction options
     */
    private function _getOptions(source: Dynamic, ?overrides: Options):Options;

    /**
     * Do not use WebAudio, force the use of legacy. This **must** be called before loading any files.
     * @name PIXI.sound#useLegacy
     * @type {boolean}
     */
    var useLegacy:Bool;

    /**
     * Removes a sound by alias.
     * @method PIXI.sound#remove
     * @param {String} alias The sound alias reference.
     * @return {PIXI.sound} Instance for chaining.
     */
    function remove(alias:String):SoundLibrary;

    /**
     * Set the global volume for all sounds. To set per-sound volume see {@link PIXI.sound#volume}.
     * @name PIXI.sound#volumeAll
     * @type {number}
     */
    var volumeAll:Float;

    /**
     * Set the global speed for all sounds. To set per-sound speed see {@link PIXI.sound#speed}.
     * @name PIXI.sound#speedAll
     * @type {number}
     */
    var speedAll:Float;

    /**
     * Toggle paused property for all sounds.
     * @method PIXI.sound#togglePauseAll
     * @return {boolean} `true` if all sounds are paused.
     */
    function togglePauseAll():Bool;

    /**
     * Pauses any playing sounds.
     * @method PIXI.sound#pauseAll
     * @return {PIXI.sound} Instance for chaining.
     */
    function pauseAll():SoundLibrary;

    /**
     * Resumes any sounds.
     * @method PIXI.sound#resumeAll
     * @return {PIXI.sound} Instance for chaining.
     */
    function resumeAll():SoundLibrary;

    /**
     * Toggle muted property for all sounds.
     * @method PIXI.sound#toggleMuteAll
     * @return {boolean} `true` if all sounds are muted.
     */
    function toggleMuteAll():Bool;

    /**
     * Mutes all playing sounds.
     * @method PIXI.sound#muteAll
     * @return {PIXI.sound} Instance for chaining.
     */
    function muteAll():SoundLibrary;

    /**
     * Unmutes all playing sounds.
     * @method PIXI.sound#unmuteAll
     * @return {PIXI.sound} Instance for chaining.
     */
    function unmuteAll():SoundLibrary;

    /**
     * Stops and removes all sounds. They cannot be used after this.
     * @method PIXI.sound#removeAll
     * @return {PIXI.sound} Instance for chaining.
     */
    function removeAll():SoundLibrary;

    /**
     * Stops all sounds.
     * @method PIXI.sound#stopAll
     * @return {PIXI.sound} Instance for chaining.
     */
    function stopAll():SoundLibrary;

    /**
     * Checks if a sound by alias exists.
     * @method PIXI.sound#exists
     * @param {String} alias Check for alias.
     * @return {boolean} true if the sound exists.
     */
    function exists(alias:String, assert:Bool = false):Bool;

    /**
     * Find a sound by alias.
     * @method PIXI.sound#find
     * @param {String} alias The sound alias reference.
     * @return {PIXI.sound.Sound} Sound object.
     */
    function find(alias:String):Sound;

    /**
     * Plays a sound.
     * @method PIXI.sound#play
     * @param {String} alias The sound alias reference.
     * @param {String} sprite The alias of the sprite to play.
     * @return {PIXI.sound.IMediaInstance|null} The sound instance, this cannot be reused
     *         after it is done playing. Returns `null` if the sound has not yet loaded.
     */

    /**
     * Plays a sound.
     * @method PIXI.sound#play
     * @param {String} alias The sound alias reference.
     * @param {Object|Function} options The options or callback when done.
     * @param {Function} [options.complete] When completed.
     * @param {Function} [options.loaded] If not already preloaded, callback when finishes load.
     * @param {number} [options.start=0] Start time offset.
     * @param {number} [options.end] End time offset.
     * @param {number} [options.speed] Override default speed, default to the Sound's speed setting.
     * @param {boolean} [options.loop] Override default loop, default to the Sound's loop setting.
     * @return {PIXI.sound.IMediaInstance|Promise<PIXI.sound.IMediaInstance>} The sound instance,
     *        this cannot be reused after it is done playing. Returns a Promise if the sound
     *        has not yet loaded.
     */
    function play(alias:String, ?options:Dynamic):EitherType<IMediaInstance, Promise<IMediaInstance>>;

    /**
     * Stops a sound.
     * @method PIXI.sound#stop
     * @param {String} alias The sound alias reference.
     * @return {PIXI.sound.Sound} Sound object.
     */
    function stop(alias:String):Sound;

    /**
     * Pauses a sound.
     * @method PIXI.sound#pause
     * @param {String} alias The sound alias reference.
     * @return {PIXI.sound.Sound} Sound object.
     */
    function pause(alias:String):Sound;

    /**
     * Resumes a sound.
     * @method PIXI.sound#resume
     * @param {String} alias The sound alias reference.
     * @return {PIXI.sound} Instance for chaining.
     */
    function resume(alias:String):Sound;

    /**
     * Get or set the volume for a sound.
     * @method PIXI.sound#volume
     * @param {String} alias The sound alias reference.
     * @param {number} [volume] Optional current volume to set.
     * @return {number} The current volume.
     */
    function volume(alias:String, ?volume:Float):Float;

    /**
     * Get or set the speed for a sound.
     * @method PIXI.sound#speed
     * @param {String} alias The sound alias reference.
     * @param {number} [speed] Optional current speed to set.
     * @return {number} The current speed.
     */
    function speed(alias:String, ?speed:Float):Float;

    /**
     * Get the length of a sound in seconds.
     * @method PIXI.sound#duration
     * @param {String} alias The sound alias reference.
     * @return {number} The current duration in seconds.
     */
    function duration(alias:String):Int;

    /**
     * Closes the sound library. This will release/destroy
     * the AudioContext(s). Can be used safely if you want to
     * initialize the sound library later. Use `init` method.
     * @method PIXI.sound#close
     * @return {PIXI.sound}
     */
    function close():SoundLibrary;
}
