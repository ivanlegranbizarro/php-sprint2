db.restaurants.find();
db.restaurants.find( {}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } );
db.restaurants.find( {}, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id: 0 } );
db.restaurants.find( {}, { restaurant_id: 1, name: 1, borough: 1, "address.zipcode": 1, _id: 0 } );
db.restaurants.find( { borough: "Bronx" } );
db.restaurants.find( { borough: "Bronx" } ).limit( 5 );
db.restaurants.find( { borough: "Bronx" } ).skip( 5 ).limit( 5 );
db.restaurants.find( { "grades.score": { $gt: 90 } } );
db.restaurants.find( { "grades.score": { $gt: 80, $lt: 100 } } );
db.restaurants.find( { "address.coord": { $lt: -95.754168 } } );
db.restaurants.find( { cuisine: { $ne: "American" }, "grades.score": { $gt: 70 }, "address.coord": { $lt: -65.754168 } } );
db.restaurants.find( { cuisine: { $ne: "American" }, "grades.score": { $gt: 70 }, "address.coord": { $lt: -65.754168 } } );
db.restaurants.find( { "grades.grade": "A", borough: { $ne: "Brooklyn" } } ).sort( { cuisine: -1 } );
db.restaurants.find( { name: { $regex: "^Wil" } }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } );
db.restaurants.find( { name: { $regex: "ces$" } }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } );
db.restaurants.find( { name: { $regex: 'Reg' } }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } );
db.restaurants.find( { $and: [ { borough: "Bronx" }, { $or: [ { cuisine: "American" }, { cuisine: "Chinese" } ] } ] } );
db.restaurants.find( { $or: [ { borough: "Staten Island" }, { borough: "Queens" }, { borough: "Bronx" }, { borough: "Brooklyn" } ] }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } );
db.restaurants.find( { $nor: [ { borough: "Staten Island" }, { borough: "Queens" }, { borough: "Bronx" }, { borough: "Brooklyn" } ] }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } );
db.restaurants.find( { "grades.score": { $lt: 10 } }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } );
db.restaurants.find( { cuisine: "Seafood", $and: [ { name: { $not: { $regex: /^Wil/ } } }, { name: { $not: { $regex: /Chinese/i } } }, { name: { $not: { $regex: /American/i } } } ] }, { restaurant_id: 1, name: 1, borough: 1, cuisine: 1 } );
db.restaurants.find( { "grades.grade": "A", "grades.score": { $eq: 11 }, "grades.date": new ISODate( "2014-08-11T00:00:00Z" ) }, { restaurant_id: 1, name: 1, grades: 1 } );
db.restaurants.find( { "grades.1.grade": "A", "grades.score": { $eq: 9 }, "grades.date": new ISODate( "2014-08-11T00:00:00Z" ) }, { restaurant_id: 1, name: 1, grades: 1 } );
db.restaurants.find( { "address.coord.1": { $gte: 42, $lte: 52 } }, { restaurant_id: 1, name: 1, address: 1 } );
db.restaurants.find().sort( { name: 1 } );
db.restaurants.find().sort( { name: -1 } );
db.restaurants.find().sort( { cuisine: 1, borough: -1 } );
db.restaurants.find( { "address.street": { $exists: true } } );
db.restaurants.find( { "address.coord": { $type: 1 } } );
db.restaurants.find( { "grades.score": { $mod: [ 7, 0 ] } }, { restaurant_id: 1, name: 1, "grades.grade": 1 } );
db.restaurants.find( { name: { $regex: /mon/i } }, { name: 1, borough: 1, "address.coord": 1, cuisine: 1 } );
db.restaurants.find( { name: { $regex: '^Mad' } }, { name: 1, borough: 1, "address.coord": 1, cuisine: 1 } );
