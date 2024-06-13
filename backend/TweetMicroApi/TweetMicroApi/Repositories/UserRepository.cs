namespace TweetMicroApi.Repositories
{
    using Newtonsoft.Json;
    using System.Collections.Generic;
    using System.IO;
    using System.Linq;
    using System.Threading.Tasks;
    using TweetMicroApi.Models;

    namespace MicroApi.Repositories
    {
        public class UserRepository 
        {
            private readonly string _filePath = @"db\users.json";

            public async Task<IEnumerable<User>> GetAllAsync()
            {
                if (!File.Exists(_filePath))
                {
                    return new List<User>();
                }

                var json = await File.ReadAllTextAsync(_filePath);
                return JsonConvert.DeserializeObject<List<User>>(json);
            }

            public async Task<User> GetByIdAsync(int id)
            {
                var users = await GetAllAsync();
                return users.FirstOrDefault(u => u.Id == id);
            }

            public async Task<User> GetByUsernameAsync(string username)
            {
                var users = await GetAllAsync();
                return users.FirstOrDefault(u => u.Username == username);
            }
            public async Task AddAsync(User user)
            {
                var users = (await GetAllAsync()).ToList();
                user.Id = users.Any() ? users.Max(u => u.Id) + 1 : 1;
                users.Add(user);
                await SaveAllAsync(users);
            }

            public async Task UpdateAsync(User user)
            {
                var users = (await GetAllAsync()).ToList();
                var existingUser = users.FirstOrDefault(u => u.Id == user.Id);
                if (existingUser != null)
                {
                    existingUser.Username = user.Username;
                    existingUser.Name = user.Name;
                    existingUser.Bio = user.Bio;
                    existingUser.Location = user.Location;
                    existingUser.FollowersCount = user.FollowersCount;
                    existingUser.FollowingCount = user.FollowingCount;
                    existingUser.JoinDate = user.JoinDate;
                    await SaveAllAsync(users);
                }
            }

            public async Task DeleteAsync(int id)
            {
                var users = (await GetAllAsync()).ToList();
                var user = users.FirstOrDefault(u => u.Id == id);
                if (user != null)
                {
                    users.Remove(user);
                    await SaveAllAsync(users);
                }
            }

            private async Task SaveAllAsync(IEnumerable<User> users)
            {
                var json = JsonConvert.SerializeObject(users, Formatting.Indented);
                await File.WriteAllTextAsync(_filePath, json);
            }

            public async Task<User> GetByUsernameAndPasswordAsync(string username, string password)
            {
                var users = await GetAllAsync();
                return users.FirstOrDefault(u => u.Username == username && u.Password == password);
            }
        }
    }

}
