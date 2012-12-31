using System.Linq;
using System.Text;

using Newtonsoft.Json.Serialization;

namespace ProjectBuilder.Controllers.Helpers.JSON
{
    public class LowercaseContractResolver : DefaultContractResolver
    {
        protected override string ResolvePropertyName(string propertyName)
        {
            var sb = new StringBuilder();
            sb.Append(propertyName.First().ToString().ToLower());
            sb.Append(propertyName.Skip(1).ToArray());
            return sb.ToString();
        }
    }
}