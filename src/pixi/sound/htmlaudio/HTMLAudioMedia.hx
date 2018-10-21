package pixi.sound.htmlaudio;
/**
 * The fallback version of Sound which uses `<audio>` instead of WebAudio API.
 * @private
 * @class HTMLAudioMedia
 * @memberof PIXI.sound.htmlaudio
 * @param {HTMLAudioElement|String|Object} options Either the path or url to the source file.
 *        or the object of options to use. See {@link PIXI.sound.Sound.from}
 */

import js.html.AudioElement;
import pixi.sound.Sound;
import pixi.sound.Sound.LoadedCallback;
import pixi.sound.filters.Filter;

 @:native("PIXI.sound.htmlaudio.HTMLAudioMedia")
extern class HTMLAudioMedia extends pixi.interaction.EventEmitter implements IMedia
{
    var parent:Sound;
    private var _source:AudioElement;

    function init(parent:Sound):Void;

    // Implement create
    function create():HTMLAudioInstance;

    // Implement isPlayable
    var isPlayable(default, null):Bool;

    // Implement duration
    var duration(default, null):Int;

    // Implement context
    var context(default, null):HTMLAudioContext;

    // Implement filters
    var filters:Array<Filter>;

    // Override the destroy
    function destroy():Void;

    /**
     * Get the audio source element.
     * @name PIXI.sound.legacy.LegacySound#source
     * @type {HTMLAudioElement}
     * @readonly
     */
    var source(default, null):AudioElement;

    // Implement the method to being preloading
    function load(?callback:LoadedCallback):Void;
}
