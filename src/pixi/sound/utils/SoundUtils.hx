package pixi.sound.utils;

import haxe.extern.EitherType;
import js.html.CanvasPattern;
import js.html.CanvasGradient;

typedef RenderOptions = {
    @:optional var width:Float;
    @:optional var height:Float;
    @:optional var fill:EitherType<String, EitherType<CanvasPattern, CanvasGradient>>;
}

typedef ExtensionMap = Map<String, Bool>;

/**
 * Utilities that work with sounds.
 * @namespace PIXI.sound.utils
 */
@:native("PIXI.sound.utils.SoundUtils")
extern class SoundUtils
{
    /**
     * The list of extensions that can be played.
     * @readonly
     * @static
     * @member {string[]} PIXI.sound.utils.extensions
     */
    static var extensions(default, null):Array<String>;

    /**
     * The list of browser supported audio formats.
     * @readonly
     * @static
     * @member {Object} PIXI.sound.utils.supported
     * @property {boolean} mp3 - `true` if file-type is supported
     * @property {boolean} ogg - `true` if file-type is supported
     * @property {boolean} oga - `true` if file-type is supported
     * @property {boolean} opus - `true` if file-type is supported
     * @property {boolean} mpeg - `true` if file-type is supported
     * @property {boolean} wav - `true` if file-type is supported
     * @property {boolean} mp4 - `true` if file-type is supported
     * @property {boolean} aiff - `true` if file-type is supported
     * @property {boolean} wma - `true` if file-type is supported
     * @property {boolean} mid - `true` if file-type is supported
     */
    static var supported(default, null):ExtensionMap;

    /**
     * Resolve a URL with different formats in glob pattern to 
     * a path based on the supported browser format. For instance:
     * "sounds/music.{ogg,mp3}", would resolve to "sounds/music.ogg"
     * if "ogg" support is found, otherwise, fallback to "sounds.music.mp3"
     * @method PIXI.sound.utils.resolveUrl
     * @static
     * @param {string|PIXI.loaders.Resource} source - Path to resolve or Resource, if
     *        a Resource object is provided, automatically updates the extension and url
     *        of that object.
     * @return {string} The format to resolve to
     */
    static function resolveUrl(source:EitherType<String, pixi.loaders.Resource>):String;

    /**
     * Create a new sound for a sine wave-based tone.  **Only supported with WebAudio**
     * @method PIXI.sound.utils.sineTone
     * @param {number} [hertz=200] Frequency of sound.
     * @param {number} [seconds=1] Duration of sound in seconds.
     * @return {PIXI.sound.Sound} New sound.
     */
    static function sineTone(hertz:Int = 200, seconds:Int = 1):Sound;

    /**
     * Render image as Texture. **Only supported with WebAudio**
     * @method PIXI.sound.utils.render
     * @param {PIXI.sound.Sound} sound Instance of sound to render
     * @param {Object} [options] Custom rendering options
     * @param {number} [options.width=512] Width of the render
     * @param {number} [options.height=128] Height of the render
     * @param {string|CanvasPattern|CanvasGradient} [options.fill='black'] Fill style for waveform
     * @return {PIXI.Texture} Result texture
     */
    static function render(sound:Sound, ?options:RenderOptions):pixi.core.textures.BaseTexture;

    /**
     * Create a new "Audio" stream based on given audio path and project uri; returns the audio object.
     * @method PIXI.sound.utils.playOnce
     * @static
     * @param {String} fileName Full path of the file to play.
     * @param {Function} callback Callback when complete.
     * @return {string} New audio element alias.
     */
    static function playOnce(url:String, ?callback: (?err:js.Error) -> void):String;
}
