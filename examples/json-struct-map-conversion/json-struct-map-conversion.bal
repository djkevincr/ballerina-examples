import ballerina/io;

struct person {
    string fname;
    string lname;
    int age;
}

struct movie {
    string title;
    string year;
    string released;
    person writer;
}

function main (string[] args) {
    movie theRevenant = {title:"The Revenant", year:"2015",
                            released:"08 Jan 2016",
                            writer:{fname:"Michael",
                                       lname:"Punke", age:30}};
    //Here's how you can convert a struct to a JSON object.
    //This conversion is unsafe.
    json j =? <json>theRevenant;
    io:println(j);
    io:println(j.writer.lname);

    // Similarly you can convert a struct to a map. This conversion is also safe.
    map m = <map>theRevenant;
    person writer =? <person>m["writer"];
    io:println(writer.age);

    //'json' to struct conversion. This conversion is unsafe because the field names and type are unknown until runtime.
    json inceptionJ = {title:"Inception", year:"2010",
                          released:"16 Jul 2010",
                          writer:{fname:"Christopher",
                                     lname:"Nolan", age:30}};
    var inception = <movie>inceptionJ;
    io:println(inceptionJ);
}
