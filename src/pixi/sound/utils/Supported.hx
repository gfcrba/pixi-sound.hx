package pixi.sound.utils;

typedef ExtensionMap = Map<String, Bool>;

/**
 * External Utility that was originally a part of the SoundUtils class 
 * in version 2.0.4. This class consists of helper functions and all audio
 * formats that are supported by Pixijs.
 */
@:native("PIXI.sound.utils.supported")
extern class Supported {
	/**
	 * The list of extensions that can be played.
	 * @readonly
	 * @static
	 * @member {string[]} PIXI.sound.utils.extensions
	 */
	static var extensions(default, null):Array<String>;

	/**
	 * Internal function to validate file type formats
	 * @private
	 * @return {object} map of support by type
	 */
	static function validateFormats():ExtensionMap;

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
	 * @property {boolean} aiff - `true` if file-type is supported
	 * @property {boolean} wma - `true` if file-type is supported
	 * @property {boolean} mid - `true` if file-type is supported
	 * @property {boolean} caf - `true` if file-type is supported. Note that for this we check if the
	 *                             'opus' codec is supported inside the caf container.
	 */
	static var supported(default, null):ExtensionMap;
}
