package pixi.sound.utils;

/**
 * External Utility that was originally a part of the SoundUtils class 
 * in version 2.0.4. This class consists of helper functions and variables
 * related to the tone of the audio.
 */
@:native("Pixi.sound.utils.sineTone")
extern class sineTone {
	/**
	 * Create a new sound for a sine wave-based tone.  **Only supported with WebAudio**
	 * @method PIXI.sound.utils.sineTone
	 * @param {number} [hertz=200] Frequency of sound.
	 * @param {number} [seconds=1] Duration of sound in seconds.
	 * @return {PIXI.sound.Sound} New sound.
	 */
	static function sineTone(hertz:Int = 200, seconds:Int = 1):Sound;
}
