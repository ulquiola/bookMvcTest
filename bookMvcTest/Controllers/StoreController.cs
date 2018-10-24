using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace bookMvcTest.Controllers
{
    public class StoreController : Controller
    {
        // GET: Store
        public ActionResult Index()
        {
            Models.bookMVCEntities db = new Models.bookMVCEntities();
            var data = db.Books;
            return View(data);
        }
        //提交订单
        [HttpGet]
        public ActionResult Order(int id)
        {
            Models.bookMVCEntities db = new Models.bookMVCEntities();
            //根据id到数据库中找到对应的书籍信息
            var book = db.Books.Where(b => b.BookId == id).FirstOrDefault() ;
            //把书籍信息保存到viewBag
            ViewBag.BookId = book.BookId;
            ViewBag.AuthorName = book.AuthorName ;
            ViewBag.Title = book.Title ;
            ViewBag.Price = book.Price ;
            ViewBag.BookCoverUrl = book.BookCoverUrl ;

            return View();
        }
        [HttpPost ]
        public ActionResult Order(int BookId,int Num,string Address)
        {
            Models.bookMVCEntities db = new Models.bookMVCEntities();

            Models.Orders myorder = new Models.Orders();
            myorder.BookId = BookId;
            myorder.Num = Num;
            myorder.Address = Address;
            db.Orders.Add(myorder);

            //将数据保存到数据库
            db.SaveChanges();
            return RedirectToAction("Details");
           
        }
        //查看订单
        public ActionResult Details()
        {
            Models.bookMVCEntities db = new Models.bookMVCEntities();
            var data = db.Orders;
            return View(data);
        }

    }
}