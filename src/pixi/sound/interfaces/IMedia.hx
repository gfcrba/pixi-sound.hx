package pixi.sound.interfaces;
/**
 * Interface represents either a WebAudio source or an HTML5 AudioElement source
 * @class IMedia
 * @memberof PIXI.sound
 * @private
 */

import pixi.sound.filters.Filter;
import pixi.sound.Sound.LoadedCallback;

interface IMedia {

    /**
     * Collection of global filters
     * @member {Array<PIXI.sound.filters.Filter>} PIXI.sound.IMedia#filters
     */
    var filters:Array<Filter>;

    /**
     * Reference to the context.
     * @member {PIXI.sound.IMediaContext} PIXI.sound.IMedia#context
     * @readonly
     */
    var context(default, null):IMediaContext;

    /**
     * Length of sound in seconds.
     * @member {number} PIXI.sound.IMedia#duration
     * @readonly
     */
    var duration(default, null):Int;

    /**
     * Flag to check if sound is currently playable (e.g., has been loaded/decoded).
     * @member {boolean} PIXI.sound.IMedia#isPlayable
     * @readonly
     */
    var isPlayable(default, null):Bool;

    // Internal methods
    public function create():IMediaInstance;
    public function init(sound:Sound):Void;
    public function load(?callback:LoadedCallback):Void;
    public function destroy():Void;
}
