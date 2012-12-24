using System.Net;
using System.Web.Mvc;

namespace ProjectBuilder.Controllers.Attributes
{
    public class HandleAjaxErrorAttribute : HandleErrorAttribute
    {
        public override void OnException(ExceptionContext filterContext)
        {
            if (!filterContext.HttpContext.Request.IsAjaxRequest())
                return;

            var errorMessage = filterContext.Exception.Message;

            filterContext.Result = new JsonResult()
            {
                Data = new
                {
                    Error = errorMessage
                }
            };
            filterContext.HttpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
            filterContext.HttpContext.Response.StatusDescription = errorMessage;
            filterContext.ExceptionHandled = true;
        }
    }
}