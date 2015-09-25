#import "com/gschat/service.gs.h"

#import <com/gsrpc/gsrpc.gs.h>


@implementation GSNamedService
+ (instancetype)init {
    return [[GSNamedService alloc] init];
}
- (instancetype)init{
    if (self = [super init]){
        
        _Name = @"";
        
        _Type = GSServiceTypeUnknown;
        
        _VNodes = (UInt32)0;
        
    }
    return self;
}
- (void) marshal:(id<GSWriter>) writer {

	[writer WriteString :_Name];


	[GSServiceTypeHelper marshal: _Type withWriter: writer];


	[writer WriteUInt32 :_VNodes];


}
- (void) unmarshal:(id<GSReader>) reader {

	_Name = [reader ReadString];


	_Type = [GSServiceTypeHelper unmarshal: reader];


	_VNodes = [reader ReadUInt32];


}

@end



@implementation GSServiceService{
    id<GSService> _service;
}
+ (instancetype) init:(id<GSService>)service withID:(UInt16) serviceID {
    return [[GSServiceService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSService>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
    case 0:
    {

        GSNamedService* ret =  [ _service Name];
        
        GSResponse * callreturn  = [GSResponse init];
        		{

			GSBytesWriter *writer = [[GSBytesWriter alloc] init];

			[ret marshal: writer];
			callreturn.Content = writer.content;

		}


        callreturn.ID = call.ID;
        callreturn.Service = call.Service;
        return callreturn;
        
        break;
    }
    
    }
    return nil;
}

@end


@implementation GSServiceRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSServiceRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Name{
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){

		GSNamedService* callreturn = [[GSNamedService alloc] init];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: response.Content];

			[callreturn unmarshal:reader ];
		}


        return ((id<GSPromise>(^)(GSNamedService*))block)(callreturn);;
    });
}

@end






@implementation GSIManagerService{
    id<GSIManager> _service;
}
+ (instancetype) init:(id<GSIManager>)service withID:(UInt16) serviceID {
    return [[GSIManagerService alloc] init: service withID: serviceID];
}
- (instancetype) init:(id<GSIManager>)service withID:(UInt16) serviceID {
    if(self = [super init]) {
        _service = service;
        _ID = serviceID;
    }
    return self;
}

- (GSResponse*) Dispatch:(GSRequest*)call {
    switch(call.Method){
    
    case 0:
    {
		NSString* arg0 = @"";

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadString];
		}

		GSDevice* arg1 = [[GSDevice alloc] init];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

			[arg1 unmarshal:reader ];
		}


        [ _service Bind: arg0  withArg1:arg1 ];
        
        break;
    }
    
    case 1:
    {
		NSString* arg0 = @"";

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[0]).Content];

			arg0 = [reader ReadString];
		}

		GSDevice* arg1 = [[GSDevice alloc] init];

		{

			GSBytesReader *reader = [GSBytesReader initWithNSData: ((GSParam*)call.Params[1]).Content];

			[arg1 unmarshal:reader ];
		}


        [ _service Unbind: arg0  withArg1:arg1 ];
        
        break;
    }
    
    }
    return nil;
}

@end


@implementation GSIManagerRPC {
    id<GSChannel> _channel;
    UInt16 _serviceID;
}
+ (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    return [[GSIManagerRPC alloc] initRPC: channel withID: serviceID];
}
- (instancetype) initRPC:(id<GSChannel>) channel withID:(UInt16) serviceID {
    if(self = [super init]) {
        _channel = channel;
        _serviceID = serviceID;
    }
    return self;
}


- (id<GSPromise>) Bind:(NSString*) arg0  withArg1:(GSDevice*) arg1 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)0;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteString :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}

	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[arg1 marshal: writer];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

- (id<GSPromise>) Unbind:(NSString*) arg0  withArg1:(GSDevice*) arg1 {
    GSRequest* call = [GSRequest init];
    call.Service = _serviceID;
    call.Method = (UInt16)1;
    
    NSMutableArray * params = [NSMutableArray array];
	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[writer WriteString :arg0];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}

	{

		GSBytesWriter *writer = [[GSBytesWriter alloc] init];

		[arg1 marshal: writer];
		GSParam *param  = [GSParam init];

		param.Content = writer.content;

		[params addObject:param];

	}


    call.Params = params;
    

    return GSCreatePromise(_channel,call,^id<GSPromise>(GSResponse* response,id block){


        return ((id<GSPromise>(^)())block)();;
    });
}

@end



