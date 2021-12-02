USE sakila;
#Ejercicio 4
select count(actor_id) from actor;
select actor_id, first_name, last_name from actor;

#Ejercicio 5
select
f.title as "Titulo",
a.first_name as "Nombre",
a.last_name as "Apellido"
from
film f inner join  film_actor f_a on f.film_id =f_a.film_id
inner join actor a on f_a.actor_id=a.actor_id
where
f.title="ACADEMY DINOSAUR" or 
f.title="BERETS AGENT"
;

# Ejercicio 6
select
	f.title as Titulo,
    c.name as Categoria
from 
	actor a inner join film_actor f_a on a.actor_id = f_a.actor_id
    inner join film f on f_a.film_id = f.film_id
    inner join film_category f_c on f.film_id = f_c.film_id
    inner join category c on f_c.category_id = c.category_id
where 
	a.first_name = "KARL" and
    a.last_name = "BERRY"
    ;
    
#Ejercicio 7
    select
	sum(f.replacement_cost) as "Costo total",
    count(f.replacement_cost) as Cantidad,
	(sum(f.replacement_cost))/count(f.replacement_cost) as "Suma Promedio"
from 
	film f inner join film_category f_c on f.film_id = f_c.film_id
    inner join category c on f_c.category_id = c.category_id
    where 
    c.name='Drama';
;

# Ejercicio 8
select
i.store_id as "Sede",
sum(pa.amount) as "Total",
c.name as "Genero"
from 
	category c inner join film_category f_c on c.category_id = f_c.category_id
    inner join film f on  f_c.film_id = f.film_id
    inner join inventory i on  f.film_id = i.film_id
    inner join rental r on  i.inventory_id = r.inventory_id
    inner join payment pa on r.rental_id = pa.rental_id
group by
	c.name 
;

#Ejercicio 9
select 
co.country as "Pais MOR", count(co.country_id) as "Cantidad Paises"
from
country co inner join city ci on co.country_id=ci.country_id
inner join address ad on ci.city_id= ad.city_id
inner join customer cu on ad.address_id=cu.address_id
group by co.country_id
;

#Ejercicio 10 
CREATE TEMPORARY TABLE Peliculas_Por_Persona (   
select 
	CONCAT(first_name, ' ', last_name) As "NOMBRE COMPLETO" , f.title as "NOMBRE DE LA PELICULA"
from
	customer co inner join rental r on co.customer_id = r.customer_id
    inner join inventory i on r.inventory_id = i.inventory_id
    inner join film f on i.film_id = f.film_id
    order by first_name
);

select * from Peliculas_Por_Persona;
#Ejercicio 11

select
r.return_date,
r.rental_date,
concat(c.first_name,' ',c.last_name) as "nombre",
datediff(r.return_date,r.rental_date) as "resta",
f.title
from
	customer c inner join rental r on c.customer_id = r.customer_id
    inner join inventory i on r.inventory_id = i.inventory_id
    inner join film f on i.film_id = f.film_id;
    



