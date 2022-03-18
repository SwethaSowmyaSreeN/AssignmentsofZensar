using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StudentCodeFirstProject.Models;

namespace StudentCodeFirstProject.Controllers
{
    public class StudentController : Controller
    {
        
        StudentContext sc = new StudentContext();
        // GET: Student
        public ActionResult Index()
        {
            List<StudentDetails> st = sc.students.ToList();
            return View(st);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(StudentDetails sd)
        {
            sc.students.Add(sd);
            sc.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            StudentDetails sd = sc.students.Find(id);
            return View(sd);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            StudentDetails sd = sc.students.Find(id);
            return View(sd);
        }
        [HttpPost]
        public ActionResult Edit(StudentDetails sd)
        {
            StudentDetails std = sc.students.Find(sd.id);
            std.Name = sd.Name;
            std.Branch = sd.Branch;
            std.City = sd.City;
            std.Percentage = sd.Percentage;
            sc.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int id)
        {
            StudentDetails sd = sc.students.Find(id);
            sc.students.Remove(sd);
            sc.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult SearchBYStudentDetails(string option, string str)
        {
            if (option == "City")
            {
                return View(sc.students.Where(x => x.City == str).ToList());
            }
            else if (option == "Percentage")
            {
                return View(sc.students.Where(x => x.Percentage.ToString() == str).ToList());
            }
            else if (option == "Branch")
            {
                return View(sc.students.Where(x => x.Branch == str).ToList());
            }
            else
            {
                return View(sc.students.Where(x => x.id.ToString() == str).ToList());
            }
        }
    }
}