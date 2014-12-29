package {

import flash.display.Sprite;
import flash.text.TextField;

public class TicTacToeGame extends Sprite {
    public function TicTacToeGame() {
        var textField:TextField = new TextField();
        textField.text = "Hello, World";
        addChild(textField);
    }
}
}
