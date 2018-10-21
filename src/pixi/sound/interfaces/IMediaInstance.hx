package pixi.sound.interfaces;
/**
 * Interface for single instance return by a Sound play call. This can either
 * be a WebAudio or HTMLAudio instance.
 * @class IMediaInstance
 * @extends PIXI.utils.EventEmitter
 * @memberof PIXI.sound
 */
interface IMediaInstance
{
    /**
     * Auto-incrementing ID for the instance.
     * @member {number} PIXI.sound.IMediaInstance#id
     */
    public var id:Int;

    /**
     * Current progress of the sound from 0 to 1
     * @member {number} PIXI.sound.IMediaInstance#progress
     */
    public var progress:Float;

    /**
     * If the instance is paused, if the sound or global context
     * is paused, this could still be false.
     * @member {boolean} PIXI.sound.IMediaInstance#paused
     */
    public var paused:Bool;

    /**
     * Current volume of the instance. This is not the actual volume
     * since it takes into account the global context and the sound volume.
     * @member {number} PIXI.sound.IMediaInstance#volume
     */
    public var volume:Float;

    /**
     * Current speed of the instance. This is not the actual speed
     * since it takes into account the global context and the sound volume.
     * @member {number} PIXI.sound.IMediaInstance#speed
     */
    public var speed:Float;

    /**
     * If the current instance is set to loop
     * @member {boolean} PIXI.sound.IMediaInstance#loop
     */
    public var loop:Bool;

    /**
     * Set the muted state of the instance
     * @member {boolean} PIXI.sound.IMediaInstance#muted
     */
    public var muted:Bool;

    /**
     * Stop the current instance from playing.
     * @method PIXI.sound.IMediaInstance#stop
     */
    public function stop():Void;

    /**
     * Fired when the sound finishes playing.
     * @event PIXI.sound.IMediaInstance#end
     */

    /**
     * Fired when the sound starts playing.
     * @event PIXI.sound.IMediaInstance#start
     */

    /**
     * Fired when the sound when progress updates.
     * @event PIXI.sound.IMediaInstance#progress
     * @param {number} progress - Playback progress from 0 to 1
     * @param {number} duration - The total number of seconds of audio
     */

    /**
     * Fired when paused state changes.
     * @event PIXI.sound.IMediaInstance#pause
     * @param {boolean} paused - If the current state is paused
     */

    /**
     * Fired when instance is paused.
     * @event PIXI.sound.IMediaInstance#paused
     */

    /**
     * Fired when instance is resumed.
     * @event PIXI.sound.IMediaInstance#resumed
     */
}
