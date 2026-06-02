using ProtocolSite.API.DTOs;
namespace ProtocolSite.API.Services.Interfaces;

public interface ISiteService
{
    Task<SiteResponse?> GetAsync(long id);
    Task<PagedResult<SiteResponse>> ListAsync(string? status, string? search, int page, int pageSize);
    Task CreateAsync(CreateSiteRequest req);
    Task<SiteResponse?> UpdateAsync(long id, UpdateSiteRequest req);
    Task<bool> DeleteAsync(long id);
}
