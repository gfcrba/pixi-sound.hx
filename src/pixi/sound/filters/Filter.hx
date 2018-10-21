package pixi.sound.filters;
/**
 * Represents a single sound element. Can be used to play, pause, etc. sound instances.
 *
 * @class Filter
 * @memberof PIXI.sound.filters
 * @param {AudioNode} destination The audio node to use as the destination for the input AudioNode
 * @param {AudioNode} [source] Optional output node, defaults to destination node. This is useful
 *        when creating filters which contains multiple AudioNode elements chained together.
 */

import js.html.audio.AudioNode;

 @:native("PIXI.sound.filters.Filter")
extern class Filter
{
    /**
     * The node to connect for the filter to the previous filter.
     * @name PIXI.sound.filters.Filter#destination
     * @type {AudioNode}
     */
    var destination:AudioNode;

    /**
     * The node to connect for the filter to the previous filter.
     * @name PIXI.sound.filters.Filter#source
     * @type {AudioNode}
     */
    var source:AudioNode;
    
    function new (destination:AudioNode, ?source:AudioNode);

    /**
     * Connect to the destination.
     * @method PIXI.sound.filters.Filter#connect
     * @param {AudioNode} destination The destination node to connect the output to
     */
    function connect(destination:AudioNode):Void;

    /**
     * Completely disconnect filter from destination and source nodes.
     * @method PIXI.sound.filters.Filter#disconnect
     */
    function disconnect():Void;

    /**
     * Destroy the filter and don't use after this.
     * @method PIXI.sound.filters.Filter#destroy
     */
    function destroy():Void;
}
