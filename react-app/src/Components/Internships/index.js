import "./index.css";
import { Component } from "react";
import { ThreeDots } from "react-loader-spinner";
import { Link } from "react-router-dom";
import { BsSearch, BsCheck2Circle } from "react-icons/bs";
import { MdOutlineTimer } from "react-icons/md";
import { MdLocationOn } from "react-icons/md";
import { MdVolumeUp, MdMic } from "react-icons/md";

const profileApiStatusConstants = {
  initial: "INITIAL",
  success: "SUCCESS",
  failure: "FAILURE",
  loading: "LOADING",
};

const jobsApiStatusConstants = {
  initial: "INITIAL",
  success: "SUCCESS",
  failure: "FAILURE",
  loading: "LOADING",
};

const rolesList = [
  { roleId: "FRONTEND", label: "Frontend Developer" },
  { roleId: "BACKEND", label: "Backend Developer" },
  { roleId: "FULLSTACK", label: "Full Stack Developer" },
  { roleId: "DATASCI", label: "Data Scientist" },
  { roleId: "MLENG", label: "AI/ML Engineer" },
  { roleId: "MOBILE", label: "Mobile App Developer" },
  { roleId: "UIUX", label: "UI/UX Designer" },
  { roleId: "CLOUD", label: "Cloud Engineer" },
  { roleId: "CYBER", label: "Cybersecurity Analyst" },
];

const sectorsList = [
  { sectorId: "AGR", label: "Agriculture" },
  { sectorId: "HLTH", label: "Healthcare / Medical" },
  { sectorId: "EDU", label: "Education" },
  { sectorId: "IT", label: "IT / Software" },
  { sectorId: "FIN", label: "Finance" },
  { sectorId: "MFG", label: "Manufacturing" },
  { sectorId: "NRG", label: "Energy" },
  { sectorId: "GOV", label: "Government / Public Policy" },
  { sectorId: "NGO", label: "Social Work / NGO" },
];

const locationsList = [
  { locationId: "NELLORE", label: "Nellore" },
  { locationId: "HYD", label: "Hyderabad" },
  { locationId: "CHENNAI", label: "Chennai" },
  { locationId: "BANG", label: "Bangalore" },
  { locationId: "DEL", label: "Delhi" },
  { locationId: "MUM", label: "Mumbai" },
  { locationId: "KOL", label: "Kolkata" },
  { locationId: "PUNE", label: "Pune" },
  { locationId: "REMOTE", label: "Remote" },
];

const employmentTypesList = [
  { employmentTypeId: "FULLTIME", label: "Full Time" },
  { employmentTypeId: "PARTTIME", label: "Part Time" },
  { employmentTypeId: "FREELANCE", label: "Freelance" },
  { employmentTypeId: "INTERNSHIP", label: "Internship" },
  { employmentTypeId: "APPRENTICE", label: "Apprenticeship" },
];

const usersList = [
  { userId: "1", label: "User 1" },
  { userId: "2", label: "User 2" },
  { userId: "3", label: "User 3" },
  { userId: "4", label: "User 4" },
  { userId: "5", label: "User 5" },
  { userId: "6", label: "User 6" },
  { userId: "7", label: "User 7" },
  { userId: "8", label: "User 8" },
  { userId: "9", label: "User 9" },
  { userId: "10", label: "User 10" },
];

class Jobs extends Component {
  state = {
    selectedUserId: "",
    userDetails: null,
    userApiStatus: profileApiStatusConstants.initial,
    jobsList: [],
    jobsApiStatus: jobsApiStatusConstants.initial,
  };

  componentDidMount() {
    this.getJobsList();
  }

  // Jobs API
  getJobsList = async () => {
    this.setState({ jobsApiStatus: jobsApiStatusConstants.loading });
    const { selectedUserId } = this.state;

    // Decide API based on whether user is selected
    const url = selectedUserId
      ? `/internships/filtered/${selectedUserId}`
      : `/internships`;

    try {
      const response = await fetch(url, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({}),
      });

      if (response.ok) {
        const data = await response.json();
        console.log("Jobs API response:", data);

        const formatted = data.map((each) => ({
          id: each.internshipId,
          title: each.title,
          companyLogoUrl: each.company.imageUrl,
          companyName: each.company.companyName,
          location: `${each.district}, ${each.state}`,
          sector: each.sector,
          jobDescription: each.description,
          duration: each.duration,
          postingTime: each.postingTime,
          appliedCount: each.appliedCount,
          totalCount: each.totalCount,
          benefits: each.benifits,
        }));

        this.setState({
          jobsList: formatted,
          jobsApiStatus: jobsApiStatusConstants.success,
        });
      } else {
        this.setState({ jobsApiStatus: jobsApiStatusConstants.failure });
      }
    } catch (error) {
      console.error("Error fetching jobs:", error);
      this.setState({ jobsApiStatus: jobsApiStatusConstants.failure });
    }
  };

  // User API
  getUserDetails = async (userId) => {
    this.setState({ userApiStatus: profileApiStatusConstants.loading });
    const url = `/users/${userId}`;
    try {
      const response = await fetch(url);
      if (response.ok) {
        const data = await response.json();
        const formatted = {
          name: data.name,
          location: data.location,
          gender: data.gender,
        };
        console.log(formatted);
        this.setState({
          userDetails: formatted,
          userApiStatus: profileApiStatusConstants.success,
        });
      } else {
        console.log("running else block");
        this.setState({ userApiStatus: profileApiStatusConstants.failure });
      }
    } catch {
      this.setState({ userApiStatus: profileApiStatusConstants.failure });
    }
  };

  onChangeUser = (event) => {
    const userId = event.target.value;
    this.setState({ selectedUserId: userId }, () => {
      if (userId) {
        this.getUserDetails(userId);
        this.getJobsList(); // fetch recommended internships immediately
      } else {
        this.getJobsList(); // reset to all internships if no user
      }
    });
  };

  onRetryUser = () => {
    const { selectedUserId } = this.state;
    if (selectedUserId) {
      this.getUserDetails(selectedUserId);
    }
  };

  onRetryJobs = () => this.getJobsList();

  // User dropdown & card renderer
  renderUserSection = () => {
    const { selectedUserId, userDetails, userApiStatus } = this.state;
    console.log(
      "User API Status:",
      userApiStatus,
      "User Details:",
      userDetails
    );

    switch (userApiStatus) {
      case profileApiStatusConstants.initial:
        return (
          <div className="filter-container">
            <h1 className="filter-title">Select User</h1>
            <select
              className="filter-dropdown"
              value={selectedUserId}
              onChange={this.onChangeUser}
            >
              <option value="">Choose a User</option>
              {usersList.map((user) => (
                <option key={user.userId} value={user.userId}>
                  {user.label}
                </option>
              ))}
            </select>
          </div>
        );

      case profileApiStatusConstants.loading:
        return (
          <div className="loader-bg" data-testid="loader">
            <ThreeDots
              height={50}
              width={50}
              color="#ffffff"
              ariaLabel="three-dots-loading"
              visible={true}
            />
          </div>
        );

      case profileApiStatusConstants.success:
        return (
          <div className="profile-card">
            <h2>Name: {userDetails.name}</h2>
            <p>Location: {userDetails.location}</p>
            <p>Gender: {userDetails.gender}</p>
          </div>
        );

      case profileApiStatusConstants.failure:
        return (
          <button
            className="retry-button"
            type="button"
            onClick={this.onRetryUser}
          >
            Retry
          </button>
        );

      default:
        return null;
    }
  };

  renderJobsSection = () => {
    const { jobsList, jobsApiStatus } = this.state;

    switch (jobsApiStatus) {
      case jobsApiStatusConstants.loading:
        return (
          <div className="loader-bg" data-testid="loader">
            <ThreeDots height={50} width={50} color="#ffffff" />
          </div>
        );
      case jobsApiStatusConstants.success:
        if (jobsList.length === 0) {
          return (
            <div className="loader-bg">
              <img
                src="https://assets.ccbp.in/frontend/react-js/no-jobs-img.png"
                alt="no jobs"
                className="failure-view-img"
              />
              <h1 className="failure-view-title">No Jobs Found</h1>
              <p className="failure-view-description">
                We could not find any jobs. Try other filters.
              </p>
            </div>
          );
        }

        return (
          <ul className="jobs-list">
            {jobsList.map((job) => (
              <Link
                to={`/jobs/${job.id}`}
                className="link"
                state={{ extraDetails: job }}
                key={job.id}
              >
                <li className="jobs-list-item">
                  <div className="job-header">
                    <img
                      src={job.companyLogoUrl}
                      alt={job.companyName}
                      className="company-logo"
                    />
                    <div>
                      <h1 className="job-title">{job.title}</h1>
                      <p className="sector">{job.sector}</p>
                    </div>
                  </div>

                  <div className="job-details-and-salary">
                    <div className="job-details">
                      <div className="icon-text-container">
                        <MdLocationOn />
                        <p className="job-location">{job.location}</p>
                      </div>
                      <div className="icon-text-container no-wrap">
                        <MdOutlineTimer />
                        <p className="job-duration">{job.duration}</p>
                      </div>
                    </div>
                    <div className="icon-text-container">
                      <BsCheck2Circle />
                      <p className="job-application">
                        {job.totalCount}/{job.appliedCount} applied
                      </p>
                    </div>
                  </div>
                  <hr />

                  <h1 className="job-details-section-title">Description</h1>
                  <p className="job-description">{job.jobDescription}</p>

                  {job.benefits && (
                    <>
                      <h1 className="job-details-section-title">Benefits</h1>
                      <p className="job-description">{job.benefits}</p>
                    </>
                  )}
                </li>
              </Link>
            ))}
          </ul>
        );
      case jobsApiStatusConstants.failure:
        return (
          <div className="loader-bg">
            <img
              src="https://assets.ccbp.in/frontend/react-js/failure-img.png"
              alt="failure view"
              className="failure-view-img"
            />
            <h1 className="failure-view-title">Oops! Something Went Wrong</h1>
            <p className="failure-view-description">
              We cannot seem to find the page you are looking for
            </p>
            <button
              type="button"
              className="retry-button"
              onClick={this.onRetryJobs}
            >
              Retry
            </button>
          </div>
        );
      default:
        return null;
    }
  };

  render() {
    return (
      <div className="jobs-page">
        <div className="search-container-sm">
          <input
            type="search"
            className="search-input"
            placeholder="Search"
            onChange={this.onSearch}
          />
          <button
            className="search-icon"
            type="button"
            data-testid="searchButton"
            onClick={this.getJobsList}
          >
            <BsSearch />
          </button>
        </div>

        <div className="jobs-page-left-panel">
          {/* user dropdown/card */}
          {this.renderUserSection()}

          {/* Role */}
          <div className="filter-container">
            <div className="label-icon-container">
              <h1 className="filter-title">Role</h1>
              <div className="accessibility-icons">
                <MdVolumeUp />
                <MdMic />
              </div>
            </div>
            <select
              className="filter-dropdown"
              name="role"
              onChange={this.onChangeRole}
            >
              <option value="">Select Role</option>
              {rolesList.map((role) => (
                <option key={role.roleId} value={role.roleId}>
                  {role.label}
                </option>
              ))}
            </select>
          </div>
          <hr />

          {/* Sector */}
          <div className="filter-container">
            <div className="label-icon-container">
              <h1 className="filter-title">Sector</h1>
              <div className="accessibility-icons">
                <MdVolumeUp />
                <MdMic />
              </div>
            </div>
            <select
              className="filter-dropdown"
              name="sector"
              onChange={this.onChangeSector}
            >
              <option value="">Select Sector</option>
              {sectorsList.map((sector) => (
                <option key={sector.sectorId} value={sector.sectorId}>
                  {sector.label}
                </option>
              ))}
            </select>
          </div>
          <hr />

          {/* Preferred Location */}
          <div className="filter-container">
            <div className="label-icon-container">
              <h1 className="filter-title">Preferred Location</h1>
              <div className="accessibility-icons">
                <MdVolumeUp />
                <MdMic />
              </div>
            </div>
            <select
              className="filter-dropdown"
              name="location"
              onChange={this.onChangeLocation}
            >
              <option value="">Select Location</option>
              {locationsList.map((location) => (
                <option key={location.locationId} value={location.locationId}>
                  {location.label}
                </option>
              ))}
            </select>
          </div>
          <hr />

          {/* Type of Employment */}

          <div className="filter-container">
            <div className="label-icon-container">
              <h1 className="filter-title">Type of Employment</h1>
              <div className="accessibility-icons">
                <MdVolumeUp />
                <MdMic />
              </div>
            </div>
            <ul className="filter-list-container">
              {employmentTypesList.map((type) => (
                <li key={type.employmentTypeId}>
                  <input
                    className="filter-checkbox"
                    type="checkbox"
                    id={type.employmentTypeId}
                    value={type.employmentTypeId}
                    onChange={this.onChangeEmploymentType}
                  />
                  <label
                    htmlFor={type.employmentTypeId}
                    className="filter-label"
                  >
                    {type.label}
                  </label>
                </li>
              ))}
            </ul>
          </div>
          <hr />
        </div>

        <div className="jobs-page-right-panel">
          <div className="search-container">
            <input
              type="search"
              className="search-input"
              placeholder="Search"
              onChange={this.onSearch}
            />
            <button
              className="search-icon"
              type="button"
              data-testid="searchButton"
              onClick={this.getJobsList}
            >
              <BsSearch />
            </button>
          </div>
          {this.renderJobsSection()}
        </div>
      </div>
    );
  }
}

export default Jobs;
