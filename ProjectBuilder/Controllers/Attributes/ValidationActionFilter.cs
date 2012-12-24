using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace ProjectBuilder.Controllers.Attributes
{
    public class ValidationActionFilter : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (!filterContext.HttpContext.Request.IsAjaxRequest())
                return;

            var modelState = filterContext.Controller.ViewData.ModelState;
            if (!modelState.IsValid)
            {
                var errorMessages = modelState.Values.Where(x => x.Errors.Count > 0).
                                                      SelectMany(x => x.Errors).
                                                      Select(x => x.ErrorMessage);
                filterContext.Result = new JsonResult()
                                           {
                                               Data = new
                                                          {
                                                              Error = errorMessages
                                                          }
                                           };
                filterContext.HttpContext.Response.StatusCode = (int) HttpStatusCode.BadRequest;
                filterContext.HttpContext.Response.StatusDescription = errorMessages.Aggregate((x, y) => x + ", " + y);
            }
        }
    }
}