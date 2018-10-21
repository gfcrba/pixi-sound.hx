package pixi.sound.htmlaudio;
/**
 * Instance which wraps the `<audio>` element playback.
 * @private
 * @class HTMLAudioInstance
 * @memberof PIXI.sound.htmlaudio
 */

import pixi.sound.interfaces.IMediaInstance;
import js.html.AudioElement;

@:native("PIXI.sound.htmlaudio.HTMLAudioInstance")
extern class HTMLAudioInstance extends pixi.interaction.EventEmitter implements IMediaInstance
{
    /**
     * Extra padding, in seconds, to deal with low-latecy of HTMLAudio.
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance.PADDING
     * @readonly
     * @default 0.1
     */
    static var PADDING(default, null):Float = 0.1;

    /**
     * The current unique ID for this instance.
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#id
     * @readonly
     */
    var id(default, null):Int;

    /**
     * The instance of the Audio element.
     * @type {HTMLAudioElement}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_source
     * @private
     */
    private var _source:AudioElement;

    /**
     * The instance of the Audio media element.
     * @type {PIXI.sound.htmlaudio.HTMLAudioMedia}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_media
     * @private
     */
    private var _media:HTMLAudioMedia;

    /**
     * Playback rate, where 1 is 100%.
     * @type {number}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_end
     * @private
     */
    private var _end:Int;

    /**
     * Current instance paused state.
     * @type {boolean}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_paused
     * @private
     */
    private var _paused:Bool;

    /**
     * Current instance muted state.
     * @type {boolean}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_muted
     * @private
     */
    private var _muted:Bool;

    /**
     * Current actual paused state.
     * @type {boolean}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_pausedReal
     * @private
     */
    private var _pausedReal:Bool;

    /**
     * Total length of the audio.
     * @type {number}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_duration
     * @private
     */
    private var _duration:Int;

    /**
     * Playback rate, where 1 is 100%.
     * @type {number}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_start
     * @private
     */
    private var _start:Int;

    /**
     * `true` if the audio is actually playing.
     * @type {boolean}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_playing
     * @private
     */
    private var _playing:Bool;

    /**
     * Volume for the instance.
     * @type {number}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_volume
     * @private
     */
    private var _volume:Float;

    /**
     * Speed for the instance.
     * @type {number}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_speed
     * @private
     */
    private var _speed:Float;

    /**
     * `true` for looping the playback
     * @type {boolean}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#_loop
     * @private
     */
    private var _loop:Bool;

    function new (parent:HTMLAudioMedia);

    /**
     * The current playback progress from 0 to 1.
     * @type {number}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#progress
     */
    var progress(default, null):Float;

    /**
     * Pauses the sound.
     * @type {boolean}
     * @name PIXI.sound.htmlaudio.HTMLAudioInstance#paused
     */
    var paused():Bool;

    /**
     * Reference: http://stackoverflow.com/a/40370077
     */
    private function _onPlay():Void;

    /**
     * Reference: http://stackoverflow.com/a/40370077
     */
    private function _onPause():Void;

    /**
     * Initialize the instance.
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#init
     * @param {PIXI.sound.htmlaudio.HTMLAudioMedia} media
     */
    public function init(media: HTMLAudioMedia):Void;

    /**
     * Stop the sound playing
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#_internalStop
     * @private
     */
    private function _internalStop():Void;

    /**
     * Stop the sound playing
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#stop
     */
    public function stop():Void;

    /**
     * Set the instance speed from 0 to 1
     * @member {number} PIXI.sound.htmlaudio.HTMLAudioInstance#speed
     */
    var speed:Float;

    /**
     * Get the set the volume for this instance from 0 to 1
     * @member {number} PIXI.sound.htmlaudio.HTMLAudioInstance#volume
     */
    var volume:Float;

    /**
     * If the sound instance should loop playback
     * @member {boolean} PIXI.sound.htmlaudio.HTMLAudioInstance#loop
     */
    var loop:Bool;

    /**
     * `true` if the sound is muted
     * @member {boolean} PIXI.sound.htmlaudio.HTMLAudioInstance#muted
     */
    var muted:Bool;

    /**
     * Call whenever the loop, speed or volume changes
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#refresh
     */
    function refresh():Void;

    /**
     * Handle changes in paused state, either globally or sound or instance
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#refreshPaused
     */
    function refreshPaused():Void;

    /**
     * Start playing the sound/
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#play
     */
    function play(options: PlayOptions):Void;

    /**
     * Handle time update on sound.
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#_onUpdate
     * @private
     */
    private function _onUpdate():Void;

    /**
     * Callback when completed.
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#_onComplete
     * @private
     */
    private function _onComplete():Void;

    /**
     * Don't use after this.
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#destroy
     */
    function destroy():Void;

    /**
     * To string method for instance.
     * @method PIXI.sound.htmlaudio.HTMLAudioInstance#toString
     * @return {String} The string representation of instance.
     * @private
     */
    function toString():String;
}
