//
//  ViewController.m
//  4.2
//
//  Created by Student1 on 2019-01-24.
//  Copyright © 2019 ziheng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* docsDir;
    NSArray* dirPaths;

    //Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

    docsDir = dirPaths[0];

    //Build the path to the database file
    _databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent: @"contacts.db"]];

    NSFileManager* fileManager = [NSFileManager defaultManager];

    if([fileManager fileExistsAtPath:_databasePath] == NO) {
        const char* dbpath = [_databasePath UTF8String];

        if(sqlite3_open(dbpath, &_contactDB) == SQLITE_OK) {
            char* errMsg;
            const char* sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, CLASS TEXT, PHONE TEXT)";

            if(sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
                _status.text = @"Failed to create table";
            }
            sqlite3_close(_contactDB);
        }


    }else{
        _status.text = @"Failed to open/create database";
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveData:(id)sender {
    sqlite3_stmt* statement;
    const char* dbPath = [_databasePath UTF8String];

    if(sqlite3_open(dbPath, &_contactDB) == SQLITE_OK){
        NSString* insertSQL = [NSString stringWithFormat:@"INSERT INTO CONTACTS (name, class, phone) VALUES(\"%@\", \"%@\", \"%@\")", _nameInput.text, _classInput.text, _phoneInput.text];

        const char* insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, insert_stmt, -1, &statement, NULL);

        if(sqlite3_step(statement) == SQLITE_DONE) {
            _status.text = @"Contact added";
            _nameInput.text = @"";
            _classInput.text = @"";
            _phoneInput.text = @"";
        }else{
            _status.text = @"Failed to add contact";
        }

        sqlite3_finalize(statement);
        sqlite3_close(_contactDB);
    }
}

- (IBAction)searchData:(id)sender {
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;

    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK) {
        NSString *querySQL = [NSString stringWithFormat:@"SELECT class, phone FROM contacts WHERE name=\"%@\"", _nameInput.text];

        const char *query_stmt = [querySQL UTF8String];

        if (sqlite3_prepare_v2(_contactDB, query_stmt, -1, &statement, NULL) == SQLITE_OK) {
            if (sqlite3_step(statement) == SQLITE_ROW) {
                NSString *classField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 0)];
                _classInput.text = classField;

                NSString *phoneField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                _phoneInput.text = phoneField;
                _status.text = @"Match found";
            } else {
                _status.text = @"Match not found";
                _classInput.text = @"";
                _phoneInput.text = @"";
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_contactDB);
    }
}
@end
