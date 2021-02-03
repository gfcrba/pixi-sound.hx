package pixi.sound;

import js.lib.ArrayBuffer;
import js.lib.AudioElement;
import js.lib.Error;
import js.lib.Promise;
import pixi.sound.interfaces.IMediaInstance;
import pixi.sound.interfaces.IMedia;
import pixi.sound.interfaces.IMediaContext;
import pixi.sound.sprites.SoundSprite;
import pixi.sound.filters.Filter;
import haxe.extern.EitherType;

// Constructor options
typedef Options = {
    @:optional var autoPlay:Bool;
    @:optional var preaload:Bool;
    @:optional var singleInstance:Bool;
    @:optional var volume:Float;
    @:optional var speed:Float;
    @:optional var complete:CompleteCallback;
    @:optional var loaded:LoadedCallback;
    @:optional var preload:Bool;
    @:optional var loop:Bool;
    @:optional var url:String;
    @:optional var source:EitherType<ArrayBuffer, AudioElement>;
    @:optional var sprites:Map<String, SoundSpriteData>;
}

// Interface for play options
typedef PlayOptions = {
    @:optional var start:Float;
    @:optional var end:Float;
    @:optional var speed:Float;
    @:optional var loop:Bool;
    @:optional var volume:Float;
    @:optional var sprite:String;
    @:optional var muted:Bool;
    @:optional var complete:CompleteCallback;
    @:optional var loaded:LoadedCallback;
}

/**
 * Callback when sound is loaded.
 * @callback PIXI.sound.Sound~loadedCallback
 * @param {Error} err The callback error.
 * @param {PIXI.sound.Sound} sound The instance of new sound.
 * @param {PIXI.sound.IMediaInstance} instance The instance of auto-played sound.
 */
typedef LoadedCallback = Error->?Sound->?IMediaInstance->Void;

/**
 * Callback when sound is completed.
 * @callback PIXI.sound.Sound~completeCallback
 * @param {PIXI.sound.Sound} sound The instance of sound.
 */
typedef CompleteCallback = Sound->Void;

/**
 * Sound represents a single piece of loaded media. When playing a sound {@link PIXI.sound.IMediaInstance} objects
 * are created. Properties such a `volume`, `pause`, `mute`, `speed`, etc will have an effect on all instances.
 * @class Sound
 * @memberof PIXI.sound
 */
@:native("PIXI.sound.Sound") 
extern class Sound
{
    /**
     * Pool of instances
     * @name PIXI.sound.Sound#_pool
     * @type {Array<IMediaInstance>}
     * @private
     */
    private static var _pool:Array<IMediaInstance>;

    /**
     * `true` if the buffer is loaded.
     * @name PIXI.sound.Sound#isLoaded
     * @type {boolean}
     * @default false
     */
    var isLoaded:Bool;

    /**
     * `true` if the sound is currently being played.
     * @name PIXI.sound.Sound#isPlaying
     * @type {boolean}
     * @default false
     * @readonly
     */
    var isPlaying(default, null):Bool;

    /**
     * true to start playing immediate after load.
     * @name PIXI.sound.Sound#autoPlay
     * @type {boolean}
     * @default false
     * @readonly
     */
    var autoPlay(default, null):Bool;

    /**
     * `true` to disallow playing multiple layered instances at once.
     * @name PIXI.sound.Sound#singleInstance
     * @type {boolean}
     * @default false
     */
    var singleInstance:Bool;

    /**
     * `true` to immediately start preloading.
     * @name PIXI.sound.Sound#preload
     * @type {boolean}
     * @default false
     * @readonly
     */
    var preload(default, null):Bool;

    /**
     * The file source to load.
     * @name PIXI.sound.Sound#url
     * @type {String}
     * @readonly
     */
    var url(default, null):String;

    /**
     * The constructor options.
     * @name PIXI.sound.Sound#options
     * @type {Object}
     * @readonly
     */
    var options(default, null):Options;

    /**
     * The audio source
     * @name PIXI.sound.Sound#media
     * @type {PIXI.sound.IMedia}
     * @private
     */
    var media:IMedia;

    /**
     * The collection of instances being played.
     * @name PIXI.sound.Sound#_instances
     * @type {Array<IMediaInstance>}
     * @private
     */
    private var _instances:Array<IMediaInstance>;

    /**
     * Reference to the sound context.
     * @name PIXI.sound.Sound#_sprites
     * @type {SoundContext}
     * @private
     */
    private var _sprites:SoundSprites;

    /**
     * The options when auto-playing.
     * @name PIXI.sound.Sound#_autoPlayOptions
     * @type {PlayOptions}
     * @private
     */
    private var _autoPlayOptions:PlayOptions;

    /**
     * The internal volume.
     * @name PIXI.sound.Sound#_volume
     * @type {number}
     * @private
     */
    private var _volume:Float;

    /**
     * The internal paused state.
     * @name PIXI.sound.Sound#_paused
     * @type {boolean}
     * @private
     */
    private var _paused:Bool;

    /**
     * The internal muted state.
     * @name PIXI.sound.Sound#_muted
     * @type {boolean}
     * @private
     */
    private var _muted:Bool;

    /**
     * The internal volume.
     * @name PIXI.sound.Sound#_loop
     * @type {boolean}
     * @private
     */
    private var _loop:Bool;

    /**
     * The internal playbackRate
     * @name PIXI.sound.Sound#_speed
     * @type {number}
     * @private
     */
    private var _speed:Float;

    /**
     * Create a new sound instance from source.
     * @method PIXI.sound.Sound.from
     * @param {ArrayBuffer|String|Object|HTMLAudioElement} options Either the path or url to the source file.
     *        or the object of options to use.
     * @param {String} [options.url] If `options` is an object, the source of file.
     * @param {HTMLAudioElement|ArrayBuffer} [options.source] The source, if already preloaded.
     * @param {boolean} [options.autoPlay=false] true to play after loading.
     * @param {boolean} [options.preload=false] true to immediately start preloading.
     * @param {boolean} [options.singleInstance=false] `true` to disallow playing multiple layered instances at once.
     * @param {number} [options.volume=1] The amount of volume 1 = 100%.
     * @param {number} [options.speed=1] The playback rate where 1 is 100% speed.
     * @param {Object} [options.sprites] The map of sprite data. Where a sprite is an object
     *        with a `start` and `end`, which are the times in seconds. Optionally, can include
     *        a `speed` amount where 1 is 100% speed.
     * @param {PIXI.sound.Sound~completeCallback} [options.complete=null] Global complete callback
     *        when play is finished.
     * @param {PIXI.sound.Sound~loadedCallback} [options.loaded=null] Call when finished loading.
     * @param {boolean} [options.loop=false] true to loop the audio playback.
     * @return {PIXI.sound.Sound} Created sound instance.
     */
    @:overload(function(source:String):Sound {})
    @:overload(function(source:Options):Sound {})
    @:overload(function(source:ArrayBuffer):Sound {})
    @:overload(function(source:AudioElement):Sound {})
    static function from(source:Dynamic):Sound;

    /**
     * Constructor, use `PIXI.sound.Sound.from`
     * @private
     */
    function new(media:IMedia, options:Options);

    /**
     * Instance of the media context
     * @name PIXI.sound.Sound#context
     * @type {PIXI.sound.IMediaContext}
     * @readonly
     */
    var context(default, null):IMediaContext;

    /**
     * Stops all the instances of this sound from playing.
     * @method PIXI.sound.Sound#pause
     * @return {PIXI.sound.Sound} Instance of this sound.
     */
    function pause():Sound;

    /**
     * Resuming all the instances of this sound from playing
     * @method PIXI.sound.Sound#resume
     * @return {PIXI.sound.Sound} Instance of this sound.
     */
    function resume():Sound;

    /**
     * Stops all the instances of this sound from playing.
     * @name PIXI.sound.Sound#paused
     * @type {boolean}
     * @readonly
     */
    var paused:Bool;

    /**
     * The playback rate
     * @name PIXI.sound.Sound#speed
     * @type {number}
     */
    var speed:Float;

    /**
     * Set the filters. Only supported with WebAudio.
     * @name PIXI.sound.Sound#filters
     * @type {Array<PIXI.sound.filters.Filter>}
     */
    var filters:Array<Filter>;

    /**
     * Add a sound sprite, which is a saved instance of a longer sound.
     * Similar to an image spritesheet.
     * @method PIXI.sound.Sound#addSprites
     * @param {String} alias The unique name of the sound sprite.
     * @param {object} data Either completed function or play options.
     * @param {number} data.start Time when to play the sound in seconds.
     * @param {number} data.end Time to end playing in seconds.
     * @param {number} [data.speed] Override default speed, default to the Sound's speed setting.
     * @return {PIXI.sound.SoundSprite} Sound sprite result.
     */
    @:overload(function (alias:String, data:SoundSpriteData):SoundSprite {})

    /**
     * Convenience method to add more than one sprite add a time.
     * @method PIXI.sound.Sound#addSprites
     * @param {Object} data Map of sounds to add where the key is the alias,
     *        and the data are configuration options, see {@PIXI.sound.Sound#addSprite} for info on data.
     * @return {Object} The map of sound sprites added.
     */
    @:overload(function(sprites:Map<String, SoundSpriteData>):SoundSprites {})

    // Actual implementation
    function addSprites(source:Dynamic, ?data:SoundSpriteData):EitherType<SoundSprite, SoundSprites>;

    /**
     * Destructor, safer to use `SoundLibrary.remove(alias)` to remove this sound.
     * @method PIXI.sound.Sound#destroy
     */
    function destroy():Void;

    /**
     * Remove all sound sprites.
     * @method PIXI.sound.Sound#removeSprites
     * @return {PIXI.sound.Sound} Sound instance for chaining.
     */

    /**
     * Remove a sound sprite.
     * @method PIXI.sound.Sound#removeSprites
     * @param {String} alias The unique name of the sound sprite.
     * @return {PIXI.sound.Sound} Sound instance for chaining.
     */
    function removeSprites(?alias:String):Sound;

    /**
     * If the current sound is playable (loaded).
     * @name PIXI.sound.Sound#isPlayable
     * @type {boolean}
     * @readonly
     */
    var isPlayable(default, null):Bool;

    /**
     * Stops all the instances of this sound from playing.
     * @method PIXI.sound.Sound#stop
     * @return {PIXI.sound.Sound} Instance of this sound.
     */
    function stop():Sound;

    /**
     * Play a sound sprite, which is a saved instance of a longer sound.
     * Similar to an image spritesheet.
     * @method PIXI.sound.Sound#play
     * @param {String} alias The unique name of the sound sprite.
     * @param {object} data Either completed function or play options.
     * @param {number} data.start Time when to play the sound in seconds.
     * @param {number} data.end Time to end playing in seconds.
     * @param {number} [data.speed] Override default speed, default to the Sound's speed setting.
     * @param {PIXI.sound.Sound~completeCallback} [callback] Callback when completed.
     * @return {PIXI.sound.IMediaInstance|Promise<PIXI.sound.IMediaInstance>} The sound instance,
     *        this cannot be reused after it is done playing. Returns a Promise if the sound
     *        has not yet loaded.
     */
    @:overload(function(alias:String, ?callback:CompleteCallback):EitherType<IMediaInstance, Promise<IMediaInstance>> {})

    /**
     * Plays the sound.
     * @method PIXI.sound.Sound#play
     * @param {PIXI.sound.Sound~completeCallback|object} options Either completed function or play options.
     * @param {number} [options.start=0] Time when to play the sound in seconds.
     * @param {number} [options.end] Time to end playing in seconds.
     * @param {String} [options.sprite] Play a named sprite. Will override end, start and speed options.
     * @param {number} [options.speed] Override default speed, default to the Sound's speed setting.
     * @param {number} [options.volume] Current volume amount for instance.
     * @param {boolean} [options.muted] Override default muted, default to the Sound's muted setting.
     * @param {boolean} [options.loop] Override default loop, default to the Sound's loop setting.
     * @param {PIXI.sound.Sound~completeCallback} [options.complete] Callback when complete.
     * @param {PIXI.sound.Sound~loadedCallback} [options.loaded] If the sound isn't already preloaded, callback when
     *        the audio has completely finished loading and decoded.
     * @return {PIXI.sound.IMediaInstance|Promise<PIXI.sound.IMediaInstance>} The sound instance,
     *        this cannot be reused after it is done playing. Returns a Promise if the sound
     *        has not yet loaded.
     */
    @:overload(function(?source:String, ?callback:CompleteCallback):EitherType<IMediaInstance, Promise<IMediaInstance>> {})
    @:overload(function(?source:PlayOptions, ?callback:CompleteCallback):EitherType<IMediaInstance, Promise<IMediaInstance>> {})


    // Overloaded function
    function play(?source:Dynamic, ?complete:CompleteCallback):EitherType<IMediaInstance, Promise<IMediaInstance>>;

    /**
     * Internal only, speed, loop, volume change occured.
     * @method refresh
     * @private
     */
    function refresh():Void;

    /**
     * Handle changes in paused state. Internal only.
     * @method refreshPaused
     * @private
     */
    function refreshPaused():Void;

    /**
     * Gets and sets the volume.
     * @name PIXI.sound.Sound#volume
     * @type {number}
     */
    var volume:Float;

    /**
     * Gets and sets the muted flag.
     * @name PIXI.sound.Sound#muted
     * @type {number}
     */
    var muted:Bool;

    /**
     * Gets and sets the looping.
     * @name PIXI.sound.Sound#loop
     * @type {boolean}
     */
    var loop:Bool;

    /**
     * Starts the preloading of sound.
     * @method PIXI.sound.Sound#_preload
     * @private
     */
    private function _preload(?callback: LoadedCallback):Void;

    /**
     * Gets the list of instances that are currently being played of this sound.
     * @name PIXI.sound.Sound#instances
     * @type {Array<PIXI.sound.IMediaInstance>}
     * @readonly
     */
    var instances(default, null):Array<IMediaInstance>;

    /**
     * Get the map of sprites.
     * @name PIXI.sound.Sound#sprites
     * @type {Object}
     * @readonly
     */
    var sprites(default, null):SoundSprites;

    /**
     * Get the duration of the audio in seconds.
     * @name PIXI.sound.Sound#duration
     * @type {number}
     */
    var duration(default, null):Float;

    /**
     * Auto play the first instance.
     * @method PIXI.sound.Sound#autoPlayStart
     * @private
     */
    function autoPlayStart():IMediaInstance;

    /**
     * Removes all instances.
     * @method PIXI.sound.Sound#_removeInstances
     * @private
     */
    private function _removeInstances():Void;

    /**
     * Sound instance completed.
     * @method PIXI.sound.Sound#_onComplete
     * @private
     * @param {PIXI.sound.IMediaInstance} instance
     */
    private function _onComplete(instance:IMediaInstance):Void;

    /**
     * Create a new instance.
     * @method PIXI.sound.Sound#_createInstance
     * @private
     * @return {PIXI.sound.IMediaInstance} New instance to use
     */
    private function _createInstance():IMediaInstance;

    /**
     * Destroy/recycling the instance object.
     * @method PIXI.sound.Sound#_poolInstance
     * @private
     * @param {PIXI.sound.IMediaInstance} instance - Instance to recycle
     */
    private function _poolInstance(instance:IMediaInstance):Void;
}
