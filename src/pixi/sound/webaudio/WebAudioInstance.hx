package pixi.sound.webaudio;
/**
 * A single play instance that handles the AudioBufferSourceNode.
 * @private
 * @class WebAudioInstance
 * @memberof PIXI.sound.webaudio
 * @param {SoundNodes} source Reference to the SoundNodes.
 */

import js.html.audio.AudioBufferSourceNode;
import js.html.audio.GainNode;
import js.html.EventListener;
import pixi.sound.interfaces.IMediaInstance;
import pixi.sound.Sound.PlayOptions;

@:native("PIXI.sound.webaudio.WebAudioInstance")
extern class WebAudioInstance extends pixi.interaction.EventEmitter implements IMediaInstance
{
    /**
     * The current unique ID for this instance.
     * @name PIXI.sound.webaudio.WebAudioInstance#id
     * @readonly
     */
    var id(default, null):Int;

    /**
     * The source Sound.
     * @type {PIXI.sound.webaudio.WebAudioMedia}
     * @name PIXI.sound.webaudio.WebAudioInstance#_media
     * @private
     */
    private var _media:WebAudioMedia;

    /**
     * true if paused.
     * @type {boolean}
     * @name PIXI.sound.webaudio.WebAudioInstance#_paused
     * @private
     */
    private var _paused:Bool;

    /**
     * true if muted.
     * @type {boolean}
     * @name PIXI.sound.webaudio.WebAudioInstance#_muted
     * @private
     */
    private var _muted:Bool;

    /**
     * true if paused.
     * @type {boolean}
     * @name PIXI.sound.webaudio.WebAudioInstance#_pausedReal
     * @private
     */
    private var _pausedReal:Bool;

    /**
     * The instance volume
     * @type {number}
     * @name PIXI.sound.webaudio.WebAudioInstance#_volume
     * @private
     */
    private var _volume:Float;

    /**
     * Last update frame number.
     * @type {number}
     * @name PIXI.sound.webaudio.WebAudioInstance#_lastUpdate
     * @private
     */
    private var _lastUpdate:Int;

    /**
     * The total number of seconds elapsed in playback.
     * @type {number}
     * @name PIXI.sound.webaudio.WebAudioInstance#_elapsed
     * @private
     */
    private var _elapsed:Int;

    /**
     * Playback rate, where 1 is 100%.
     * @type {number}
     * @name PIXI.sound.webaudio.WebAudioInstance#_speed
     * @private
     */
    private var _speed:Float;

    /**
     * Playback rate, where 1 is 100%.
     * @type {number}
     * @name PIXI.sound.webaudio.WebAudioInstance#_end
     * @private
     */
    private var _end:Float;

    /**
     * `true` if should be looping.
     * @type {boolean}
     * @name PIXI.sound.webaudio.WebAudioInstance#_loop
     * @private
     */
    private var _loop:Bool;

    /**
     * Gain node for controlling volume of instance
     * @type {GainNode}
     * @name PIXI.sound.webaudio.WebAudioInstance#_gain
     * @private
     */
    private var _gain:GainNode;

    /**
     * Length of the sound in seconds.
     * @type {number}
     * @name PIXI.sound.webaudio.WebAudioInstance#_duration
     * @private
     */
    private var _duration:Int;

    /**
     * The progress of the sound from 0 to 1.
     * @type {number}
     * @name PIXI.sound.webaudio.WebAudioInstance#_progress
     * @private
     */
    private var _progress:Float;

    /**
     * Callback for update listener
     * @type {EventListener}
     * @name PIXI.sound.webaudio.WebAudioInstance#_updateListener
     * @private
     */   
    private var _updateListener:EventListener;

    /**
     * Audio buffer source clone from Sound object.
     * @type {AudioBufferSourceNode}
     * @name PIXI.sound.webaudio.WebAudioInstance#_source
     * @private
     */
    private var _source:AudioBufferSourceNode;

    function new(media:WebAudioMedia);

    /**
     * Stops the instance, don't use after this.
     * @method PIXI.sound.webaudio.WebAudioInstance#stop
     */
    function stop():Void;

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
     * `true` if the sound is muted
     * @member {boolean} PIXI.sound.htmlaudio.HTMLAudioInstance#muted
     */
    var muted:Bool;

    /**
     * If the sound instance should loop playback
     * @member {boolean} PIXI.sound.htmlaudio.HTMLAudioInstance#loop
     */
    var loop:Bool;

    /**
     * Refresh loop, volume and speed based on changes to parent
     * @method PIXI.sound.webaudio.WebAudioInstance#refresh
     */
    function refresh():Void;

    /**
     * Handle changes in paused state, either globally or sound or instance
     * @method PIXI.sound.webaudio.WebAudioInstance#refreshPaused
     */
    function refreshPaused():Void;

    /**
     * Plays the sound.
     * @method PIXI.sound.webaudio.WebAudioInstance#play
     * @param {Object} options Play options
     * @param {number} options.start The position to start playing, in seconds.
     * @param {number} options.end The ending position in seconds.
     * @param {number} options.speed Speed for the instance
     * @param {boolean} options.loop If the instance is looping, defaults to sound loop
     * @param {number} options.volume Volume of the instance
     * @param {boolean} options.muted Muted state of instance
     */
    function play(options:PlayOptions):Void;

    /**
     * Utility to convert time in millseconds or seconds
     * @method PIXI.sound.webaudio.WebAudioInstance#_toSec
     * @private
     * @param {number} [time] Time in either ms or sec
     * @return {number} Time in seconds
     */
    private function _toSec(?time:Int):Int;

    /**
     * The current playback progress from 0 to 1.
     * @type {number}
     * @name PIXI.sound.webaudio.WebAudioInstance#progress
     */
    var progress(default, null):Float;

    /**
     * Pauses the sound.
     * @type {boolean}
     * @name PIXI.sound.webaudio.WebAudioInstance#paused
     */
    var paused:Bool;

    /**
     * Don't use after this.
     * @method PIXI.sound.webaudio.WebAudioInstance#destroy
     */
    function destroy():Void;

    /**
     * To string method for instance.
     * @method PIXI.sound.webaudio.WebAudioInstance#toString
     * @return {string} The string representation of instance.
     * @private
     */
    function toString():String;

    /**
     * Get the current time in seconds.
     * @method PIXI.sound.webaudio.WebAudioInstance#_now
     * @private
     * @return {number} Seconds since start of context
     */
    private function _now():Int;

    /**
     * Internal update the progress.
     * @method PIXI.sound.webaudio.WebAudioInstance#_update
     * @private
     */
    private function _update(force:Bool = false):Void;

    /**
     * Initializes the instance.
     * @method PIXI.sound.webaudio.WebAudioInstance#init
     */
    function init(media:WebAudioMedia):Void;

    /**
     * Stops the instance.
     * @method PIXI.sound.webaudio.WebAudioInstance#_internalStop
     * @private
     */
    private function _internalStop():Void;

    /**
     * Callback when completed.
     * @method PIXI.sound.webaudio.WebAudioInstance#_onComplete
     * @private
     */
    private function _onComplete():Void;
}
