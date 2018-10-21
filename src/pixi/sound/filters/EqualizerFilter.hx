package pixi.sound.filters;

/**
 * Filter for adding equalizer bands.
 *
 * @class EqualizerFilter
 * @memberof PIXI.sound.filters
 * @param {number} [f32=0] Default gain for 32 Hz
 * @param {number} [f64=0] Default gain for 64 Hz
 * @param {number} [f125=0] Default gain for 125 Hz
 * @param {number} [f250=0] Default gain for 250 Hz
 * @param {number} [f500=0] Default gain for 500 Hz
 * @param {number} [f1k=0] Default gain for 1000 Hz
 * @param {number} [f2k=0] Default gain for 2000 Hz
 * @param {number} [f4k=0] Default gain for 4000 Hz
 * @param {number} [f8k=0] Default gain for 8000 Hz
 * @param {number} [f16k=0] Default gain for 16000 Hz
 */

 import js.html.audio.BiquadFilterNode;

 interface Band {
    f:Float;
    type:String;
    gain:Float;
}

 @:native("PIXI.sound.filters.EqualizerFilter")
extern class EqualizerFilter extends Filter
{
    /**
     * Band at 32 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F32
     * @type {number}
     * @readonly
     */
    static var F32(default, null):Int;

    /**
     * Band at 64 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F64
     * @type {number}
     * @readonly
     */
    static var F64(default, null):Int;
    
    /**
     * Band at 125 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F125
     * @type {number}
     * @readonly
     */
    static var F125(default, null):Int;
    
    /**
     * Band at 250 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F250
     * @type {number}
     * @readonly
     */
    static var F250(default, null):Int;
    
    /**
     * Band at 500 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F500
     * @type {number}
     * @readonly
     */
    static var F500(default, null):Int;
    
    /**
     * Band at 1000 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F1K
     * @type {number}
     * @readonly
     */
    static var F1K(default, null):Int;
    
    /**
     * Band at 2000 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F2K
     * @type {number}
     * @readonly
     */
    static var F2K(default, null):Int;
    
    /**
     * Band at 4000 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F4K
     * @type {number}
     * @readonly
     */
    static var F4K(default, null):Int;
    
    /**
     * Band at 8000 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F8K
     * @type {number}
     * @readonly
     */
    static var F8K(default, null):Int;
    
    /**
     * Band at 16000 Hz
     * @name PIXI.sound.filters.EqualizerFilter.F16K
     * @type {number}
     * @readonly
     */
    static var F16K(default, null):Int;

    /**
     * The list of bands 
     * @name PIXI.sounds.filters.EqualizerFilter#bands
     * @type {BiquadFilterNode[]}
     * @readonly
     */
    var bands(default, null):Array<BiquadFilterNode>;

    /**
     * The map of bands to frequency
     * @name PIXI.sounds.filters.EqualizerFilter#bandsMap
     * @type {Object}
     * @readonly
     */
    var bandsMap(default, null):Map<Int, BiquadFilterNode>;

    function new (f32:Int = 0, f64:Int = 0, f125:Int = 0, f250:Int = 0, f500:Int = 0,
        f1k:Int = 0, f2k:Int = 0, f4k:Int = 0, f8k:Int = 0, f16k:Int = 0);

    /**
     * Set gain on a specific frequency.
     * @method PIXI.sound.filters.EqualizerFilter#setGain
     * @param {number} frequency The frequency, see EqualizerFilter.F* for bands
     * @param {number} [gain=0] Recommended -40 to 40.
     */
    function setGain(frequency:Int, gain:Int = 0):Void;

    /**
     * Get gain amount on a specific frequency.
     * @method PIXI.sound.filters.EqualizerFilter#getGain
     * @return {number} The amount of gain set.
     */
    function getGain(frequency:Int):Int;

    /**
     * Gain at 32 Hz frequency.
     * @name PIXI.sound.filters.EqualizerFilter#f32
     * @type {number}
     * @default 0
     */
    var f32:Int;

    /**
     * Gain at 64 Hz frequency.
     * @name PIXI.sound.filters.EqualizerFilter#f64
     * @type {number}
     * @default 0
     */
    var f64:Int;

    /**
     * Gain at 125 Hz frequencey.
     * @name PIXI.sound.filters.EqualizerFilter#f125
     * @type {number}
     * @default 0
     */
    var f125:Int;

    /**
     * Gain at 250 Hz frequencey.
     * @name PIXI.sound.filters.EqualizerFilter#f250
     * @type {number}
     * @default 0
     */
    var f250:Int;

    /**
     * Gain at 500 Hz frequencey.
     * @name PIXI.sound.filters.EqualizerFilter#f500
     * @type {number}
     * @default 0
     */
    var f500:Int;

    /**
     * Gain at 1 KHz frequencey.
     * @name PIXI.sound.filters.EqualizerFilter#f1k
     * @type {number}
     * @default 0
     */
    var f1k:Int;

    /**
     * Gain at 2 KHz frequencey.
     * @name PIXI.sound.filters.EqualizerFilter#f2k
     * @type {number}
     * @default 0
     */
    var f2k:Int;

    /**
     * Gain at 4 KHz frequencey.
     * @name PIXI.sound.filters.EqualizerFilter#f4k
     * @type {number}
     * @default 0
     */
    var f4k:Int;

    /**
     * Gain at 8 KHz frequencey.
     * @name PIXI.sound.filters.EqualizerFilter#f8k
     * @type {number}
     * @default 0
     */
    var f8k:Int;

    /**
     * Gain at 16 KHz frequencey.
     * @name PIXI.sound.filters.EqualizerFilter#f16k
     * @type {number}
     * @default 0
     */
    var f16k:Int;

    /**
     * Reset all frequency bands to have gain of 0
     * @method PIXI.sound.filters.EqualizerFilter#reset
     */
    function reset():Void;

    function destroy():Void;
}
