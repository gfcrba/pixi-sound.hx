package pixi.sound.webaudio;
import js.html.audio.AudioBuffer;
/**
 * Represents a single sound element. Can be used to play, pause, etc. sound instances.
 * @private
 * @class WebAudioMedia
 * @memberof PIXI.sound.webaudio
 * @param {PIXI.sound.Sound} parent - Instance of parent Sound container
 */

import js.html.audio.AudioBufferSourceNode;
import js.html.ArrayBuffer;
import pixi.sound.interfaces.IMedia;
import pixi.sound.filters.Filter;
import pixi.sound.Sound;
import pixi.sound.Sound.LoadedCallback;

@:native("PIXI.sound.webaudio.WebAudioMedia")
extern class WebAudioMedia implements IMedia
{
    /**
     * Reference to the parent Sound container.
     * @name PIXI.sound.webaudio.WebAudioMedia#parent
     * @type {PIXI.sound.Sound}
     * @readonly
     */
    var parent(default, null):Sound;

    /**
     * The file buffer to load.
     * @name PIXI.sound.webaudio.WebAudioMedia#source
     * @type {ArrayBuffer}
     * @readonly
     */
    var source(default, null):ArrayBuffer;

    /**
     * Instance of the chain builder.
     * @name PIXI.sound.webaudio.WebAudioMedia#_nodes
     * @type {PIXI.sound.webaudio.WebAudioNodes}
     * @private
     */
    private var _nodes:WebAudioNodes;

    /**
     * Instance of the source node.
     * @name PIXI.sound.webaudio.WebAudioMedia#_source
     * @type {AudioBufferSourceNode}
     * @private
     */
    private var _source:AudioBufferSourceNode;

    function init(parent:Sound):Void;

    /**
     * Destructor, safer to use `SoundLibrary.remove(alias)` to remove this sound.
     * @private
     * @method PIXI.sound.webaudio.WebAudioMedia#destroy
     */
    function destroy():Void;

    // Implement create
    function create():WebAudioInstance;

    // Implement context
    var context(default, null):WebAudioContext;
    
    // Implement isPlayable
    var isPlayable(default, null):Bool;
    
    // Implement filters
    var filters:Array<Filter>;

    // Implements duration
    var duration(default, null):Int;

    /**
     * Gets and sets the buffer.
     * @name PIXI.sound.webaudio.WebAudioMedia#buffer
     * @type {AudioBuffer}
     */
    var buffer:AudioBuffer;

    /**
     * Get the current chained nodes object
     * @private
     * @name PIXI.sound.webaudio.WebAudioMedia#nodes
     * @type {PIXI.sound.webaudio.WebAudioNodes}
     */
    var nodes(default, null):WebAudioNodes;

    // Implements load
    function load(?callback:LoadedCallback):Void;

    /**
     * Loads a sound using XHMLHttpRequest object.
     * @method PIXI.sound.webaudio.WebAudioMedia#_loadUrl
     * @private
     */
    private function _loadUrl(?callback:LoadedCallback):Void;

    /**
     * Decodes the array buffer.
     * @method PIXI.sound.webaudio.WebAudioMedia#decode
     * @param {ArrayBuffer} arrayBuffer From load.
     * @private
     */
    private function _decode(arrayBuffer:ArrayBuffer, ?callback:LoadedCallback):Void;
}
