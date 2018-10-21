package pixi.sound.filters;
/**
 * Filter for adding reverb. Refactored from 
 * https://github.com/web-audio-components/simple-reverb/
 *
 * @class ReverbFilter
 * @memberof PIXI.sound.filters
 * @param {number} [seconds=3] Seconds for reverb
 * @param {number} [decay=2] The decay length
 * @param {boolean} [reverse=false] Reverse reverb
 */

import js.html.audio.ConvolverNode;

 @:native("PIXI.sound.filters.ReverbFilter")
extern class ReverbFilter extends Filter
{
    /**
     * The covolver node
     * @name PIXI.sound.filters.ReverbFilter#_convolver
     * @type {ConvolverNode}
     * @private
     */
    private var _convolver:ConvolverNode;

    /**
     * @name PIXI.sound.filters.ReverbFilter#_seconds
     * @type {number}
     * @private
     */
    private var _seconds:Int;

    /**
     * @name PIXI.sound.filters.ReverbFilter#_decay
     * @type {number}
     * @private
     */
    private var _decay:Int;

    /**
     * @name PIXI.sound.filters.ReverbFilter#_reverse
     * @type {number}
     * @private
     */
    private var _reverse:Int;

    function new(seconds:Int = 3, decay:Int = 2, reverse:Bool = false);

    /**
     * Clamp a value
     * @method PIXI.sound.filters.ReverbFilter#_clamp 
     * @private
     * @param {number} value
     * @param {number} min Minimum value
     * @param {number} max Maximum value
     * @return {number} Clamped number
     */
    private function _clamp(value:Int, min:Int, max:Int):Int

    /**
     * Length of reverb in seconds from 1 to 50
     * @name PIXI.sound.filters.ReverbFilter#decay
     * @type {number}
     * @default 3
     */
    var seconds:Int;

    /**
     * Decay value from 0 to 100
     * @name PIXI.sound.filters.ReverbFilter#decay
     * @type {number}
     * @default 2
     */
    var decay:Int;

    /**
     * Reverse value from 0 to 1
     * @name PIXI.sound.filters.ReverbFilter#reverse
     * @type {boolean}
     * @default false
     */
    var reverse:Bool;

    /**
     * Utility function for building an impulse response
     * from the module parameters.
     * @method PIXI.sound.filters.ReverbFilter#_rebuild
     * @private
     */
    private function _rebuild():Void;

    function destroy():Void;
}
