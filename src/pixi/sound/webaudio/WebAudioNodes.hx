package pixi.sound.webaudio;

import js.html.audio.AnalyserNode;
import js.html.audio.AudioBufferSourceNode;
import js.html.audio.GainNode;
import js.html.audio.ScriptProcessorNode;
import pixi.sound.Filterable;

/**
 * Output for cloneing node
 * @interface PIXI.sound.SoundNodes~SourceClone
 * @property {AudioBufferSourceNode} source Cloned audio buffer source
 * @property {GainNode} gain Independent volume control
 */
typedef SourceClone = {
    public var source:AudioBufferSourceNode;
    public var gain:GainNode;
};

/**
 * @private
 * @class WebAudioNodes
 * @extends PIXI.sound.Filterable
 * @private
 * @memberof PIXI.sound.webaudio
 * @param {PIXI.sound.webaudio.WebAudioContext} audioContext The audio context.
 */
 @:native("PIXI.sound.webaudio.WebAudioNodes")
extern class WebAudioNodes extends Filterable
{
    /**
     * The buffer size for script processor
     * @name PIXI.sound.SoundNodes.BUFFER_SIZE
     * @type {number}
     * @default 256
     */
    static var BUFFER_SIZE:Int;

    /**
     * Get the buffer source node
     * @name PIXI.sound.SoundNodes#bufferSource
     * @type {AudioBufferSourceNode}
     * @readonly
     */
    var bufferSource(default, null):AudioBufferSourceNode;

    /**
     * Get the script processor node.
     * @name PIXI.sound.SoundNodes#script
     * @type {ScriptProcessorNode}
     * @readonly
     */
    var script(default, null):ScriptProcessorNode;

    /**
     * Get the gain node
     * @name PIXI.sound.SoundNodes#gain
     * @type {GainNode}
     * @readonly
     */
    var gain(default, null):GainNode;

    /**
     * Get the analyser node
     * @name PIXI.sound.SoundNodes#analyser
     * @type {AnalyserNode}
     * @readonly
     */
    var analyser(default, null):AnalyserNode;

    /**
     * Reference to the SoundContext
     * @name PIXI.sound.SoundNodes#context
     * @type {PIXI.sound.webaudio.WebAudioContext}
     * @readonly
     */
    var context(default, null):WebAudioContext;

    function new(context:WebAudioContext);

    /**
     * Cleans up.
     * @method PIXI.sound.SoundNodes#destroy
     */
    function destroy():Void;

    /**
     * Clones the bufferSource. Used just before playing a sound.
     * @method PIXI.sound.SoundNodes#cloneBufferSource
     * @returns {PIXI.sound.SoundNodes~SourceClone} The clone AudioBufferSourceNode.
     */
    function cloneBufferSource():SourceClone;
}
