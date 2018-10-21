package pixi.sound.htmlaudio;

/**
 * The fallback version of WebAudioContext which uses `<audio>` instead of WebAudio API.
 * @private
 * @class HTMLAudioContext
 * @extends PIXI.util.EventEmitter
 * @memberof PIXI.sound.htmlaudio
 */

import js.html.audio.AudioContext;
import pixi.sound.filters.Filter;
import pixi.sound.interfaces.IMediaContext;

@:native("PIXI.sound.htmlaudio.HTMLAudioContext")
extern class HTMLAudioContext extends pixi.interaction.EventEmitter implements IMediaContext
{
    /**
     * Current global speed from 0 to 1
     * @name PIXI.sound.htmlaudio.HTMLAudioContext#speed
     * @type {number}
     * @default 1
     */
    var speed:Float;

    /**
     * Current muted status of the context
     * @name PIXI.sound.htmlaudio.HTMLAudioContext#muted
     * @type {boolean}
     * @default false
     */
    var muted:Bool;

    /**
     * Current volume from 0 to 1
     * @name PIXI.sound.htmlaudio.HTMLAudioContext#volume
     * @type {number}
     * @default 1
     */
    var volume:Float;

    /**
     * Current paused status
     * @name PIXI.sound.htmlaudio.HTMLAudioContext#paused
     * @type {boolean}
     * @default false
     */
    var paused:Bool;

    function new ();

    /**
     * Internal trigger when volume, mute or speed changes
     * @method PIXI.sound.htmlaudio.HTMLAudioContext#refresh
     * @private
     */
    function refresh():Void;

    /**
     * Internal trigger paused changes
     * @method PIXI.sound.htmlaudio.HTMLAudioContext#refreshPaused
     * @private
     */
    function refreshPaused():Void;

    /**
     * HTML Audio does not support filters, this is non-functional API.
     * @type {Array<PIXI.sound.filters.Filter>}
     * @name PIXI.sound.htmlaudio.HTMLAudioContext#filters
     * @default null
     */
    var filters:Array<Filter>;

    /**
     * HTML Audio does not support `audioContext`
     * @type {null}
     * @name PIXI.sound.htmlaudio.HTMLAudioContext#audioContext
     * @default null
     * @readonly
     */
    var audioContext:AudioContext;

    /**
     * Toggles the muted state.
     * @method PIXI.sound.htmlaudio.HTMLAudioContext#toggleMute
     * @return {boolean} The current muted state.
     */
    function toggleMute():Bool;

    /**
     * Toggles the paused state.
     * @method PIXI.sound.htmlaudio.HTMLAudioContext#togglePause
     * @return {boolean} The current paused state.
     */
    function togglePause():Bool;

    /**
     * Destroy and don't use after this
     * @method PIXI.sound.htmlaudio.HTMLAudioContext#destroy
     */
    function destroy():Void;
}
