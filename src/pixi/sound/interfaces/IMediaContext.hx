package pixi.sound.interfaces;
/**
 * Represents the audio context for playing back sounds. This can 
 * represent either an HTML or WebAudio context.
 * @class IMediaContext
 * @memberof PIXI.sound
 */
 
import pixi.sound.filters.Filter;
import js.html.audio.AudioContext;

interface IMediaContext
{
    /**
     * `true` if all sounds are muted
     * @member {boolean} PIXI.sound.IMediaContext#muted
     */
    public var muted:Bool;

    /**
     * Volume to apply to all sounds
     * @member {number} PIXI.sound.IMediaContext#volume
     */
    public var volume:Float;

    /**
     * The speed of all sounds
     * @member {number} PIXI.sound.IMediaContext#speed
     */
    public var speed(default, null):Float;

    /**
     * Set the paused state for all sounds
     * @member {boolean} PIXI.sound.IMediaContext#paused
     */
    public var paused:Bool;

    /**
     * Collection of global filters
     * @member {Array<PIXI.sound.filters.Filter>} PIXI.sound.IMediaContext#filters
     */
    public var filters:Array<Filter>;

    /**
     * Toggle mute for all sounds
     * @method PIXI.sound.IMediaContext#toggleMute
     */
    public function toggleMute():Bool;

    /**
     * Toggle pause for all sounds
     * @method PIXI.sound.IMediaContext#togglePause
     */
    public function togglePause():Bool;

    /**
     * Dispatch event to refresh all instances volume, mute, etc.
     * @method PIXI.sound.IMediaContext#refresh
     * @private
     */
    public function refresh():Void;

    /**
     * Destroy the context and don't use after this.
     * @method PIXI.sound.IMediaContext#destroy
     */
    public function destroy():Void;

    /**
     * Reference to the Web Audio API AudioContext element, if Web Audio is available
     * @member {AudioContext} PIXI.sound.IMediaContext#audioContext
     */
    public var audioContext(default, null):AudioContext;
}
