package controller {
import component.Pile;

import model.MainModel;

public class MainController {
	private var _model:MainModel;

	public function MainController(model:MainModel) {
		this._model = model;
	}

	public function startNewRound(pile:Pile):void {
		if (_model.hasWinner)
			return;

		_model.round % 2 == 0 ? pile.drawCircle() : pile.drawMark();

		if (somePlayerWins()) {
			_model.hasWinner = true;
		}
		else {
			_model.round++;
			_model.playerId = _model.playerId == 0 ? 1 : 0;
		}
	}

	public function startNewGame():void {
		_model.hasWinner = false;
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

	private function somePlayerWins():Boolean {
		var result:Boolean = false;

		for (var i:int = 0; i < 3; i++) {
			if (checkRow(i))
				return true;
			if (checkColumn(i))
				return true;
		}

		if (checkFirstDiagonal())
			return true;
		if (checkSecondDiagonal())
			return true;

		return result;
	}

	private function checkRow(row:int):Boolean {
		var result:Boolean = true;
		var pile:Pile;
		var selectedFlag:int;
		for (var j:int = 0; j < 3; j++) {
			pile = _model.piles[row][j];
			if (pile.selectedFlag == Pile.SELECTED_FLAG_NOTHING)
				return false;
			if (j == 0) {
				selectedFlag = pile.selectedFlag;
			}
			else {
				if (selectedFlag != pile.selectedFlag)
					return false;
			}
		}
		return result;
	}

	private function checkColumn(column:int):Boolean {
		var result:Boolean = true;
		var pile:Pile;
		var selectedFlag:int;
		for (var j:int = 0; j < 3; j++) {
			pile = _model.piles[j][column];
			if (pile.selectedFlag == Pile.SELECTED_FLAG_NOTHING)
				return false;
			if (j == 0) {
				selectedFlag = pile.selectedFlag;
			}
			else {
				if (selectedFlag != pile.selectedFlag)
					return false;
			}
		}
		return result;
	}

	private function checkFirstDiagonal():Boolean {
		var result:Boolean = true;
		var pile:Pile;
		var selectedFlag:int;
		for (var j:int = 0; j < 3; j++) {
			pile = _model.piles[j][j];
			if (pile.selectedFlag == Pile.SELECTED_FLAG_NOTHING)
				return false;
			if (j == 0) {
				selectedFlag = pile.selectedFlag;
			}
			else {
				if (selectedFlag != pile.selectedFlag)
					return false;
			}
		}
		return result;
	}

	private function checkSecondDiagonal():Boolean {
		var result:Boolean = true;
		var pile:Pile;
		var selectedFlag:int;
		for (var j:int = 0; j < 3; j++) {
			pile = _model.piles[j][2 - j];
			if (pile.selectedFlag == Pile.SELECTED_FLAG_NOTHING)
				return false;
			if (j == 0) {
				selectedFlag = pile.selectedFlag;
			}
			else {
				if (selectedFlag != pile.selectedFlag)
					return false;
			}
		}
		return result;
	}
}
}
