﻿using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using PreguntORT.Models;

namespace PreguntORT.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Privacy()
    {
        return View();
    }
   
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

    public IActionResult ConfigurarJuego()
    {
        ViewBag.Categorias = Juego.ObtenerCategoria();
        ViewBag.Dificultad = Juego.ObtenerDificultades();
        Juego.InicializarJuego();
        if(ViewBag.facil == true){
            ViewBag.dificultad_elegida = "Facil";
        }
        if(ViewBag.normal == true){
            ViewBag.dificultad_elegida = "Normal";
        }
        if(ViewBag.dificil == true){
            ViewBag.dificultad_elegida = "Dificil";
        }
        if(ViewBag.aleatorio == true){
            ViewBag.dificultad_elegida = "Aleatorio";
        }
        return View("ConfigurarJuego");
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
       Juego.CargarPartida(username,dificultad,categoria);
       Console.WriteLine(username,dificultad,categoria);
        List<Pregunta> Listado = null;
        Listado = BD.ObtenerPreguntas(dificultad, categoria);
        if(Listado!=null){
            return RedirectToAction("Jugar", new{_username=username});
        }
        else{
            return RedirectToAction("ConfigurarJuego");
        }
    }
    public IActionResult Jugar()
    {
        ViewBag.puntaje = Juego.ObtenerPuntaje();
        ViewBag.pregunta_actual = Juego.ObtenerProximaPregunta();
        ViewBag.username=Juego.ObtenerUsername();
        if(ViewBag.pregunta_actual != null)
        {
            ViewBag.Respuestas = Juego.ObtenerProximasRespuestas(ViewBag.pregunta_actual.idPregunta);
            return View("Jugar");

        } else return RedirectToAction("Fin"); 
    }
    [HttpPost] public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.Correcta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return View("Respuesta");
    }
       public IActionResult Fin()
    {
        ViewBag.username=Juego.ObtenerUsername();
        ViewBag.puntaje = Juego.ObtenerPuntaje();
        return View("Fin");
    }
}
