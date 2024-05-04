using BRDrycleaningDataAccess;
using FluentAssertions;
namespace BRDryCleaningTests.UnitTests
{
    public class Utilities_UnitTests
    {
        [Fact]
        public void Utilities_WhenHashingAPassword_ThenProduceConsistentHash()
        {
            // Arrange
            var testPassword = $"NewPassword1x_$#";

            // Act
            var salt = PasswordHasher.BuildRandomSalt();
            var passwordHash = PasswordHasher.SlowHash(testPassword, salt);
            var verifiedPasswordHash = PasswordHasher.SlowHash(testPassword, salt);

            // Assert
            passwordHash.Should().Be(verifiedPasswordHash);
        }
    }
}
