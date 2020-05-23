#import <Flipswitch/FSSwitchDataSource.h>
#import <Flipswitch/FSSwitchPanel.h>

@interface HomeButtonRestingUnlockSwitch : NSObject <FSSwitchDataSource>
@end

extern "C" BOOL _AXSHomeButtonRestingUnlock();
extern "C" void _AXSHomeButtonSetRestingUnlock(BOOL);

@implementation HomeButtonRestingUnlockSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	return _AXSHomeButtonRestingUnlock() ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	if (newState == FSSwitchStateIndeterminate)
		return;
	_AXSHomeButtonSetRestingUnlock(newState == FSSwitchStateOn);
}

@end
