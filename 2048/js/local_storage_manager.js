function FakeStorage() {
    this.bestScore = 0;
    this.gameState = null;
    this.mute = false;
}

FakeStorage.prototype.clearGameState = function () {
    this.bestScore = 0;
};

function LocalStorageManager() {
  window.fakeStorage = new FakeStorage();
  var supported = this.objcStorageSupported();
  this.storage = supported ? window.objcLocalStorage : window.fakeStorage;

    // cache mute value
    this.muteCache = this.storage.mute;
}

LocalStorageManager.prototype.objcStorageSupported = function () {
    if (window.objcLocalStorage) {
        return true;
    }
    
    return false;
};

// Best score getters/setters
LocalStorageManager.prototype.getBestScore = function () {
  return this.storage.bestScore || 0;
};

LocalStorageManager.prototype.setBestScore = function (score) {
  this.storage.bestScore = score;
};

// Sound effect enable/disable
LocalStorageManager.prototype.setMute = function (flag) {
    this.muteCache = flag;
    this.storage.mute = flag;
};
LocalStorageManager.prototype.getMute = function () {
    return this.muteCache;
};

// Game state getters/setters and clearing
LocalStorageManager.prototype.getGameState = function () {
  var stateJSON = this.storage.gameState;
  return stateJSON ? JSON.parse(stateJSON) : null;
};

LocalStorageManager.prototype.setGameState = function (gameState) {
  this.storage.gameState = JSON.stringify(gameState);
};

LocalStorageManager.prototype.clearGameState = function () {
  this.storage.clearGameState();
};
