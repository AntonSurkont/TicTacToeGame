package {
import flash.display.Sprite;

import model.MainModel;
import view.MainView;
import controller.MainController;

[SWF(width="500", height="650", backgroundColor="#014A7F")]

public class TicTacToeGame extends Sprite {
	private var _model:MainModel;
	private var _view:MainView;
	private var _controller:MainController;

    public function TicTacToeGame() {
		_model = new MainModel();
		_controller = new MainController(_model);
		_view = new MainView(_model, _controller);
		addChild(_view);
    }
}
}
