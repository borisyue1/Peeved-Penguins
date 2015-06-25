import Foundation
//objective C API, foundation for .swift file

class MainScene: CCNode {

    func play() {
        let gameplayScene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(gameplayScene)
    }

}
