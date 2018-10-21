package pixi.sound.webaudio;
/**
 * Main class to handle WebAudio API. There's a simple chain
 * of AudioNode elements: analyser > compressor > context.destination.
 * any filters that are added are inserted between the analyser and compressor nodes
 * @private
 * @class WebAudioContext
 * @extends PIXI.sound.Filterable
 * @memberof PIXI.sound.webaudio
 */

import js.Error;
import js.html.ArrayBuffer;
import js.html.audio.AnalyserNode;
import js.html.audio.AudioBuffer;
import js.html.audio.AudioContext;
import js.html.audio.DynamicsCompressorNode;
import js.html.audio.OfflineAudioContext;
import pixi.sound.Filterable;
import pixi.sound.interfaces.IMediaContext;

@:native("PIXI.sound.webaudio.WebAudioContext")
extern class WebAudioContext extends Filterable implements IMediaContext
{
    /**
     * Context Compressor node
     * @name PIXI.sound.webaudio.WebAudioContext#compressor
     * @type {DynamicsCompressorNode}
     * @readonly
     */
    var compressor(default, null):DynamicsCompressorNode;

    /**
     * Context Analyser node
     * @name PIXI.sound.webaudio.WebAudioContext#analyser
     * @type {AnalyserNode}
     * @readonly
     */
    var analyser(default, null):AnalyserNode;

    /**
     * Global speed of all sounds
     * @name PIXI.sound.webaudio.WebAudioContext#speed
     * @type {number}
     * @readonly
     */
    var speed(default, null):Float;

    /**
     * Sets the muted state.
     * @type {boolean}
     * @name PIXI.sound.webaudio.WebAudioContext#muted
     * @default false
     */
    var muted:Bool;

    /**
     * Sets the volume from 0 to 1.
     * @type {number}
     * @name PIXI.sound.webaudio.WebAudioContext#volume
     * @default 1
     */
    var volume:Float;

    /**
     * Handle global events
     * @type {PIXI.utils.EventEmitter}
     * @name PIXI.sound.webaudio.WebAudioContext#events
     * @default 1
     */
    var events:pixi.interaction.EventEmitter;

    /**
     * The instance of the AudioContext for WebAudio API.
     * @name PIXI.sound.webaudio.WebAudioContext#_ctx
     * @type {AudioContext}
     * @private
     */
    private var _ctx:AudioContext;

    /**
     * The instance of the OfflineAudioContext for fast decoding audio.
     * @name PIXI.sound.webaudio.WebAudioContext#_offlineCtx
     * @type {OfflineAudioContext}
     * @private
     */
    private var _offlineCtx:OfflineAudioContext;

    /**
     * Current paused status
     * @name PIXI.sound.webaudio.WebAudioContext#_paused
     * @type {boolean}
     * @private
     * @default false
     */
    private var _paused:Bool;

    /**
     * Indicated whether audio on iOS has been unlocked, which requires a touchend/mousedown event that plays an
     * empty sound.
     * @name PIXI.sound.webaudio.WebAudioContext#_unlocked
     * @type {boolean}
     * @private
     */
    private var _unlocked:Bool;

    function new();

    /**
     * Try to unlock audio on iOS. This is triggered from either WebAudio plugin setup (which will work if inside of
     * a `mousedown` or `touchend` event stack), or the first document touchend/mousedown event. If it fails (touchend
     * will fail if the user presses for too long, indicating a scroll event instead of a click event.
     *
     * Note that earlier versions of iOS supported `touchstart` for this, but iOS9 removed this functionality. Adding
     * a `touchstart` event to support older platforms may preclude a `mousedown` even from getting fired on iOS9, so we
     * stick with `mousedown` and `touchend`.
     * @method PIXI.sound.webaudio.WebAudioContext#_unlock
     * @private
     */
    private function _unlock():Void;

    /**
     * Plays an empty sound in the web audio context.  This is used to enable web audio on iOS devices, as they
     * require the first sound to be played inside of a user initiated event (touch/click).
     * @method PIXI.sound.webaudio.WebAudioContext#playEmptySound
     */
    function playEmptySound():Void;

    /**
     * Get AudioContext class, if not supported returns `null`
     * @name PIXI.sound.webaudio.WebAudioContext.AudioContext
     * @type {Function}
     * @static
     */
    var AudioContext:Class<AudioContext>;

    /**
     * Get OfflineAudioContext class, if not supported returns `null`
     * @name PIXI.sound.webaudio.WebAudioContext.OfflineAudioContext
     * @type {Function}
     * @static
     */
    var OfflineAudioContext:Class<OfflineAudioContext>;

    /**
     * Destroy this context.
     * @method PIXI.sound.webaudio.WebAudioContext#destroy
     */
    function destroy():Void;

    /**
     * The WebAudio API AudioContext object.
     * @name PIXI.sound.webaudio.WebAudioContext#audioContext
     * @type {AudioContext}
     * @readonly
     */
    var audioContext(default, null):AudioContext;

    /**
     * The WebAudio API OfflineAudioContext object.
     * @name PIXI.sound.webaudio.WebAudioContext#offlineContext
     * @type {OfflineAudioContext}
     * @readonly
     */
    var offlineContext(default, null):OfflineAudioContext;

    /**
     * Pauses all sounds, even though we handle this at the instance
     * level, we'll also pause the audioContext so that the 
     * time used to compute progress isn't messed up.
     * @type {boolean}
     * @name PIXI.sound.webaudio.WebAudioContext#paused
     * @default false
     */
    var paused:Bool;

    /**
     * Emit event when muted, volume or speed changes
     * @method PIXI.sound.webaudio.WebAudioContext#refresh
     * @private
     */
    function refresh():Void;

    /**
     * Emit event when muted, volume or speed changes
     * @method PIXI.sound.webaudio.WebAudioContext#refreshPaused
     * @private
     */
    function refreshPaused():Void;

    /**
     * Toggles the muted state.
     * @method PIXI.sound.webaudio.WebAudioContext#toggleMute
     * @return {boolean} The current muted state.
     */
    function toggleMute():Bool;

    /**
     * Toggles the paused state.
     * @method PIXI.sound.webaudio.WebAudioContext#togglePause
     * @return {boolean} The current muted state.
     */
    function togglePause():Bool;

    /**
     * Decode the audio data
     * @method PIXI.sound.webaudio.WebAudioContext#decode
     * @param {ArrayBuffer} arrayBuffer Buffer from loader
     * @param {Function} callback When completed, error and audioBuffer are parameters.
     */
    function decode(arrayBuffer:ArrayBuffer, callback:?Error->?AudioBuffer->Void):Void;
}
