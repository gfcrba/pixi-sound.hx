package pixi.sound.sprites;
import pixi.sound.interfaces.IMediaInstance;
// Sound sprite data setup

/**
 * Object that represents a single Sound's sprite.
 * @class SoundSprite
 * @memberof PIXI.sound
 * @param {PIXI.sound.Sound} parent The parent sound
 * @param {Object} options Data associated with object.
 * @param {number} options.start The start time in seconds.
 * @param {number} options.end The end time in seconds.
 * @param {number} [options.speed] The optional speed, if not speed, uses
 *        the default speed of the parent.
 */

import pixi.sound.Sound;
import pixi.sound.Sound.CompleteCallback;
import haxe.extern.EitherType;
import js.Promise;

typedef SoundSpriteData = {
    var start:Int;
    var end:Int;
    var speed:Float;
}

// Collection of sound sprites
typedef SoundSprites = Map<String, SoundSprite>;

@:native("PIXI.sound.SoundSprite")
extern class SoundSprite
{
    /**
     * The reference sound
     * @name PIXI.sound.SoundSprite#parent
     * @type {PIXI.sound.Sound}
     * @readonly
     */
    var parent(default, null):Sound;

    /**
     * The starting location in seconds.
     * @name PIXI.sound.SoundSprite#start
     * @type {number}
     * @readonly
     */
    var start(default, null):Int;

    /**
     * The ending location in seconds
     * @name PIXI.sound.SoundSprite#end
     * @type {number}
     * @readonly
     */
    var end(default, null):Int;

    /**
     * The speed override where 1 is 100% speed playback.
     * @name PIXI.sound.SoundSprite#speed
     * @type {number}
     * @readonly
     */
    var speed(default, null):Float;

    /**
     * The duration of the sound in seconds.
     * @name PIXI.sound.SoundSprite#duration
     * @type {number}
     * @readonly
     */
    var duration(default, null):Int;

    /**
     * Constructor
     */
    function new(parent:Sound, options:SoundSpriteData);

    /**
     * Play the sound sprite.
     * @method PIXI.sound.SoundSprite#play
     * @param {PIXI.sound.Sound~completeCallback} [complete] Function call when complete
     * @return {PIXI.sound.IMediaInstance|Promise<PIXI.sound.IMediaInstance>} Sound instance being played.
     */
    function play(?complete:CompleteCallback):EitherType<IMediaInstance, Promise<IMediaInstance>>;

    /**
     * Destroy and don't use after this
     * @method PIXI.sound.SoundSprite#destroy
     */
    function destroy():Void;
}
