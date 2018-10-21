import pixi.sound.SoundLibrary;
import pixi.interaction.InteractionEvent;
import pixi.sound.Sound;
import pixi.core.graphics.Graphics;
import pixi.core.display.Container;
import pixi.loaders.Loader;
import js.Browser;
import pixi.plugins.app.Application;

class  Main extends Application {
    
    var _container:Container;
    var _testGraphics:Graphics;
    var _soundLibrary:SoundLibrary;

    public function new() {
        super();
        width = Browser.window.innerWidth;
        height = Browser.window.innerHeight;
        backgroundColor = 0xa3a3a3;
        super.start();

        _soundLibrary = SoundLibrary.instance;
        _container = new Container();
        stage.addChild(_container);
        addContent();
    }

    function addContent() {
        _testGraphics = new Graphics().beginFill(0xff3322).drawRect(0, 0, 250, 100).endFill();
        _testGraphics.position.set(100, 100);
        _testGraphics.interactive = true;
        _testGraphics.on('touchstart', onClick);
        _testGraphics.click = onClick;
        _container.addChild(_testGraphics);
    }

    function onClick(target:InteractionEvent) {
        _soundLibrary.play('test_sound');
    }

    static function main() {
        preload(function() {
            new Main();
        });
    }

    static function preload(start:Void->Void) {
        var sounds = {
            'test_sound':'assets/mpthreetest.mp3'
        };
        SoundLibrary.instance.add(sounds, {
            preload:true, 
            loaded:function(?_) {
                start();
            }
        });
    }
}
