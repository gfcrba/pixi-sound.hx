package pixi.sound.utils;

import haxe.extern.EitherType;
import js.html.CanvasPattern;
import js.html.CanvasGradient;

typedef RenderOptions = {
	@:optional var width:Float;
	@:optional var height:Float;
	@:optional var fill:EitherType<String, EitherType<CanvasPattern, CanvasGradient>>;
}

/**
 * External Utility that was originally a part of the SoundUtils class 
 * in version 2.0.4. This class consists of helper functions and variables
 * related to rendering audio.
 */
@:native("PIXI.sound.utils.render")
extern class Render {
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
}
