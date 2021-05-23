import './card.dart';
import './player.dart';

class Bid {
  Player _player;
  Card _offer;

  Bid(this._player, this._offer);

  Card get offer => _offer;
  Player get player => _player;
}
