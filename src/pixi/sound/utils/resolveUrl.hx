package pixi.sound.utils;

/**
 * External Utility that was originally a part of the SoundUtils class 
 * in version 2.0.4. This class consists of helper functions and variables
 * related to parsing audio URLS.
 */
@:native("PIXI.sound.utils.resolveUrl")
extern class resolveUrl {
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
}
