package pixi.sound;

import js.html.audio.AudioNode;
import pixi.sound.filters.Filter;

/**
 * Abstract class which SoundNodes and SoundContext
 * both extend. This provides the functionality for adding
 * dynamic filters.
 * @class Filterable
 * @memberof PIXI.sound
 * @param {AudioNode} source The source audio node
 * @param {AudioNode} destination The output audio node
 * @private
 */
@:native("PIXI.sound.Filterable")
extern class Filterable
{
    /**
     * Get the gain node
     * @name PIXI.sound.Filterable#_input
     * @type {AudioNode}
     * @private
     */
    private var _input:AudioNode;

    /**
     * The destination output audio node
     * @name PIXI.sound.Filterable#_output
     * @type {AudioNode}
     * @private
     */
    private var _output:AudioNode;

    /**
     * Collection of filters.
     * @name PIXI.sound.Filterable#_filters
     * @type {PIXI.sound.filters.Filter[]}
     * @private
     */
    private var _filters:Array<Filter>;

    function new (input:AudioNode, output:AudioNode);

    /**
     * The destination output audio node
     * @name PIXI.sound.Filterable#destination
     * @type {AudioNode}
     * @readonly
     */
    var destination(default, null):AudioNode;

    /**
     * The collection of filters
     * @name PIXI.sound.Filterable#filters
     * @type {PIXI.sound.filters.Filter[]}
     */
    var filters:Array<Filter>;

    /**
     * Cleans up.
     * @method PIXI.sound.Filterable#destroy
     */
    function destroy():Void;
}
