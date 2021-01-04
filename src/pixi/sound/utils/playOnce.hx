package pixi.sound.utils;

/**
 * External Utility that was originally a part of the SoundUtils class 
 * in version 2.0.4. This class consists of helper functions and variables
 * related to single play instances for audio.
 */
@:native("Pixi.sound.utils.playOnce")
extern class playOnce {
	/**
	 * Increment the alias for play once
	 * @static
	 * @private
	 * @default 0
	 */
	static final PLAY_ID:Int = 0;

	/**
	 * Create a new "Audio" stream based on given audio path and project uri; returns the audio object.
	 * @method PIXI.sound.utils.playOnce
	 * @static
	 * @param {String} fileName Full path of the file to play.
	 * @param {Function} callback Callback when complete.
	 * @return {string} New audio element alias.
	 */
	static function playOnce(url:String, ?callback:(?err:js.Error) -> void):String;
}
