#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    [self addObstacle];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    // put update code here
    
    //increment the time since last obstacle was added
    timeSinceObstacle += delta; //delta is approx 1/60th of a second
    
    
    //chech to see if two seconds have passed
    if (timeSinceObstacle > 2.0f)
    {
        //add new obstacle
        [self addObstacle];
        
        //reset timer
        timeSinceObstacle = 0.0f;
    }
}

// put new methods here
- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    //this will be called every time a player touches the screen
    [character flap];
}

@end
