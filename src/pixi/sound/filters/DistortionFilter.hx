package pixi.sound.filters;
/**
 * Filter for adding adding delaynode.
 *
 * @class DistortionFilter
 * @memberof PIXI.sound.filters
 * @param {number} [amount=0] The amount of distoration from 0 to 1.
 */
 
import js.html.audio.WaveShaperNode;

 @:native("PIXI.sound.filters.DistortionFilter")
extern class DistortionFilter extends Filter
{
    /**
     * The Wave shape node use to distort
     * @name PIXI.sound.filters.DistortionFilter#_distortion
     * @type {WaveShaperNode}
     * @private
     */
    private var _distortion:WaveShaperNode;

    /**
     * The amount of distoration
     * @name PIXI.sound.filters.DistortionFilter#_amount
     * @type {number}
     * @private
     */
    private var _amount:Float;

    function new (amount:Float = 0);

    /**
     * @name PIXI.sound.filters.Distoration#amount
     * @type {number}
     */
    var amount:Float;

    function destroy():Void;
}
