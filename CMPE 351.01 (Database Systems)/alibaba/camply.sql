select c.name from `rating-campground` rc
join campground c on rc.Campground_campgroundId = c.idCampground
join user u on rc.User_userId = u.idUser
where u.idUser = 116200051;

select * from campground c
join user u on c.User_idUser = u.idUser
where u.idUser = 116200051;

select c.name from `rating-campground` `r-c`
join campground c on `r-c`.Campground_campgroundId = c.idCampground
where `r-c`.score = 5;

select u.name from user u
where u.location = 'antalya';

select c.text from comment c
join user u on c.User_idUser = u.idUser
where c.username = 'enes0';