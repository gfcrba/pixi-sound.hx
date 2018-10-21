package pixi.sound.filters;
/**
 * Filter for adding Stereo panning.
 *
 * @class StereoFilter
 * @memberof PIXI.sound.filters
 * @param {number} [pan=0] The amount of panning, -1 is left, 1 is right, 0 is centered.
 */

import js.html.audio.StereoPannerNode;
import js.html.audio.PannerNode;

@:native("PIXI.sound.filters.StereoFilter")
extern class StereoFilter extends Filter
{
    /**
     * The stereo panning node
     * @name PIXI.sound.filters.StereoFilter#_stereo
     * @type {StereoPannerNode}
     * @private
     */
    private var _stereo:StereoPannerNode;

    /**
     * The stereo panning node
     * @name PIXI.sound.filters.StereoFilter#_panner
     * @type {PannerNode}
     * @private
     */
    private var _panner:PannerNode;

    /**
     * The amount of panning, -1 is left, 1 is right, 0 is centered
     * @name PIXI.sound.filters.StereoFilter#_pan
     * @type {number}
     * @private
     */
    private var _pan:Float;

    function new (pan:Float = 0);

    /**
     * Set the amount of panning, where -1 is left, 1 is right, and 0 is centered
     * @name PIXI.sound.filters.StereoFilter#pan
     * @type {number}
     */
    var pan:Float;

    function destroy():Void;
}
