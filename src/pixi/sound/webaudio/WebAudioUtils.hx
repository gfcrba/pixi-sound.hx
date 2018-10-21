package pixi.sound.webaudio;

import js.html.audio.AudioParam;

/**
 * Internal class for Web Audio abstractions and convenience methods.
 * @private
 * @class WebAudioUtils
 * @memberof PIXI.sound.webaudio
 */
@:native("PIXI.sound.webaudio.WebAudioUtils")
extern class WebAudioUtils
{
    /**
     * Dezippering is removed in the future Web Audio API, instead
     * we use the `setValueAtTime` method, however, this is not available
     * in all environments (e.g., Android webview), so we fallback to the `value` setter.
     * @method PIXI.sound.webaudio.WebAudioUtils.setParamValue
     * @private
     * @param {AudioParam} param - AudioNode parameter object
     * @param {number} value - Value to set
     * @return {number} The value set
     */
    static function setParamValue(param:AudioParam, value:Float):Float;
}
