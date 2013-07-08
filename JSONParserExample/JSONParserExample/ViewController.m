//
//  ViewController.m
//  JSONParserExample
//
//  Created by Virginia Armas on 7/7/13.
//  Copyright (c) 2013 Synergy-GB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self parsearJson];
    [self crearJson];
}

- (void) parsearJson {
    NSString *dataPrueba = @"{ \"prueba\": \"valor prueba\"}";
    
    NSData* data = [dataPrueba dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *e = nil;
    id res = [NSJSONSerialization JSONObjectWithData:data
                                             options: NSJSONReadingMutableContainers
                                               error: &e];
    
    if ([res isKindOfClass:[NSArray class]]) {
        NSLog(@"Es un array");
    } else if ([res isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Es un dictionary");
    }

}

- (void) crearJson {
    
    NSDictionary *object = [NSDictionary dictionaryWithObjectsAndKeys:@"Valor prueba",@"prueba", nil];
    
    NSError *e = nil;
    NSData *dataJson;
    
    if ([NSJSONSerialization isValidJSONObject:object]) {
        dataJson = [NSJSONSerialization dataWithJSONObject:object
                                                   options:0
                                                     error:&e];
        
        NSString* jsonString = [[NSString alloc] initWithData:dataJson
                                                     encoding:NSUTF8StringEncoding];
        NSLog(@"JSON = %@", jsonString);
        
    } else {
        NSLog(@"El objeto no es válido");
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
