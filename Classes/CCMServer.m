
#import "CCMServer.h"
#import "CCMProject.h"


@implementation CCMServer

- (id)initWithURL:(NSURL *)anUrl andProjectNames:(NSArray *)projectNames
{
	[super init];
	url = [anUrl retain];
	projects = [[NSMutableDictionary alloc] init];
	NSEnumerator *nameEnum = [projectNames objectEnumerator];
	NSString *name;
	while((name = [nameEnum nextObject]) != nil)
		[projects setObject:[[[CCMProject alloc] initWithName:name] autorelease] forKey:name];		
	return self;
}

- (void)dealloc
{
	[url release];
	[projects release];
	[super dealloc];
}

- (NSURL *)url
{
	return url;
}

- (NSArray *)projects
{
	return [projects allValues];
}

- (CCMProject *)projectNamed:(NSString *)name
{
	return [projects objectForKey:name];
}

- (void)updateWithProjectInfo:(NSDictionary *)info
{
	CCMProject *project = [projects objectForKey:[info objectForKey:@"name"]];
	if(project != nil)
		[project updateWithInfo:info];
}


@end
