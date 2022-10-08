import setuptools

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name="autotune",
    version="0.0.1",
    author="Matthew Wimberly",
    author_email="matthew.wimb@gmail.com",
    description="Make your database sing",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/mattdood/autotune",
    project_urls={
        "Bug Tracker": "https://github.com/mattdood/autotune/issues",
    },
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    packages=setuptools.find_packages(include=["autotune", "autotune.*"]),
    package_data={},
    python_requires=">=3.6",
)
