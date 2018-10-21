package pixi.sound.filters;
/**
 * Combine all channels into mono channel.
 *
 * @class MonoFilter
 * @memberof PIXI.sound.filters
 */

import js.html.audio.ChannelMergerNode;

 @:native("PIXI.sound.filters.MonoFilter")
extern class MonoFilter extends Filter
{
    /**
     * Merger node
     * @name PIXI.sound.filters.MonoFilter#_merge
     * @type {ChannelMergerNode}
     * @private
     */
    private var _merger:ChannelMergerNode;

    function new();

    function destroy():Void;
}
