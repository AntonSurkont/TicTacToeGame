package controller {
import component.Pile;

import model.MainModel;

public class MainController {
	private var _model:MainModel;

	public function MainController(model:MainModel) {
		this._model = model;
	}

	public function startNewRound(pile:Pile):void {
		if (_model.round % 2 == 0) {
			pile.drawCircle();
		}
		else {
			pile.drawMark();
		}

		_model.round++;
		_model.playerId = _model.playerId == 0 ? 1 : 0;
	}

	public function startNewGame():void {
		_model.round = 1;
		_model.playerId = MainModel.getPlayerId();

		var pile:Pile;
		for (var i:int = 0; i < 3; i++) {
			for (var j:int = 0; j < 3; j++) {
				pile = _model.piles[i][j];
				pile.reset();
			}
		}
	}
}
}
